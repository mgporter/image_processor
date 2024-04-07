import { memo } from "react";
import wasm from "./BlurWasmSrc.wasm?url";

function createImportObj(data: Uint8Array) {
  

  return {
    env: {
      __memory_base: 0,
      __table_base: 0,
      memory: new WebAssembly.Memory({initial: length, maximum: length}),
      // table: new WebAssembly.Table({ initial: 2, element: "anyfunc" }),
      // abort: console.log,
      // log(num) {
      //   console.log(num);
      // },
    },
    // ["GOT.mem"]: {
    //   buffer: data.buffer,
    // }
  };
}

async function BlurWasm(data: Uint8Array, width: number, height: number) {


  // Create new memory
  // const length =  data.byteLength / 65536;
  const length = 1024;
  let memory = new WebAssembly.Memory({initial: length, maximum: length});

  const importObj = {
    a: {
      a: memory,
    },
  };

  const result = await WebAssembly.instantiateStreaming(fetch(wasm), importObj);
  const exports = result.instance.exports;
  console.log(result)

  // Reset pointer to beginning of WASM's memory
  // memory = result.instance.exports.memory;

  // Create a view based on the 
  const heap = new Uint8Array(memory.buffer);
  
  // Copy data from image ArrayBuffer to heap
  for (let i = 0; i < data.byteLength; i++) {
    heap[i] = data[i];
  }

  // console.log(heap);
  // console.log(data.byteLength);
  const start = performance.now();
  const byteOffset = exports.c(width, height, 0, data.byteLength);
  console.log(performance.now() - start);
  // console.log(heap);
  // console.log(byteOffset);

  return new Uint8Array(heap.buffer.slice(data.byteLength*2, data.byteLength*3));
}

export { BlurWasm };