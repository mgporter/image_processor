import wasm from "./BlurWasmSrc.wasm?url";

async function BlurWasm(data: Uint8Array, width: number, height: number, grid: number[]) {

  // Create new memory
  const MEMORY_LENGTH = 1024;
  const memory = new WebAssembly.Memory({initial: MEMORY_LENGTH, maximum: MEMORY_LENGTH});

  const importObj = {
    env: {
      memory: memory,
    },
  };

  const result = await WebAssembly.instantiateStreaming(fetch(wasm), importObj);
  const exports = result.instance.exports;

  // Create a memory space for the grid (the Gaussian blur array)
  const GRID_OFFSET = 0;
  const gridMemory = new Float64Array(memory.buffer, GRID_OFFSET, grid.length);

  // Copy the grid's values to the heap, so that the WASM module can access them
  for (let i = 0; i < grid.length; i++) {
    gridMemory[i] = grid[i];
  }

  // Create a memory space for the image data
  const DATA_OFFSET = memory.buffer.byteLength - (data.byteLength * 2);
  const heap = new Uint8Array(memory.buffer, DATA_OFFSET, data.byteLength);
  
  // Copy data from image ArrayBuffer to heap
  for (let i = 0; i < data.byteLength; i++) {
    heap[i] = data[i];
  }

  const start = performance.now();

  // Call the blur function
  // @ts-expect-error no type declaration yet for the exported wasm method "blur"
  exports.blur(width, height, DATA_OFFSET, data.byteLength, GRID_OFFSET, grid.length);
  const calcTime = performance.now() - start;
  
  return {calcTime: calcTime, result: new Uint8Array(heap.buffer.slice(DATA_OFFSET, DATA_OFFSET + data.byteLength))};
}

export { BlurWasm };