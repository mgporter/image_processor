import { EffectResult } from "../components/WorkerExecutor";

type Pixel = [number, number, number, number];
type Coordinate = [number, number];

class BlurJS {

  private data;
  private width;
  private height;

  constructor(data: Uint8Array, width: number, height: number) {
    this.data = data;
    this.width = width;
    this.height = height;
  }

  async blur(grid: number[]): Promise<EffectResult> {

    const start = performance.now();

    const output = new Uint8Array(this.data.byteLength);
    const halflength = Math.floor(grid.length / 2);

    // Do horizontal pass
    for (let px = 0; px < this.data.length; px += 4) {
      const [x, y] = this.indexToXY(px);
      const sumRGBA: Pixel = [0,0,0,0];

      for (let j = 0; j < grid.length; j++) {
        const offset = j - halflength;
        this.addValuesToPixel(sumRGBA, this.getPixel(this.data, x + offset, y), grid[j]);
      }

      this.setPixelFromIndex(output, sumRGBA, px);

    }

    // Do Vertical pass
    for (let px = 0; px < this.data.length; px += 4) {
      const [x, y] = this.indexToXY(px);
      const sumRGBA: Pixel = [0,0,0,0];

      for (let j = 0; j < grid.length; j++) {
        const offset = j - halflength;
        this.addValuesToPixel(sumRGBA, this.getPixel(output, x, y + offset), grid[j]);
      }

      this.setPixelFromIndex(this.data, sumRGBA, px);

    }

    const calcTime = performance.now() - start;

    return {calcTime: calcTime, result: this.data};

  }

  addValuesToPixel(pixel: Pixel, valuesToAdd: Pixel, amount: number) {
    pixel.forEach((x, i) => pixel[i] += ( valuesToAdd[i] * amount) );
  }

  indexToXY(i: number): Coordinate {
    i /= 4;
    return [i % this.width, Math.floor(i / this.width)];
  }

  getPixelFromIndex(array: Uint8Array, i: number): Pixel {
    return [array[i], array[i+1], array[i+2], array[i+3]];  // [R, G, B, A];
  }

  setPixelFromIndex(array: Uint8Array, pixel: Pixel, i: number): void {
    array[i] = pixel[0];
    array[i+1] = pixel[1];
    array[i+2] = pixel[2];
    array[i+3] = pixel[3];
  }

  getPixel(array: Uint8Array, x: number, y: number): Pixel {
    const i = this.coordinatesToIndex(x, y);
    return this.getPixelFromIndex(array, i);
  }

  coordinatesToIndex(x: number, y: number): number {
    x = this.clampCoordinate(x, this.width);
    y = this.clampCoordinate(y, this.height);
    return ((x % this.width) + (y * this.width)) * 4;
  }

  clampCoordinate(x: number, max: number): number {
    if (x < 0) x = Math.abs(x);
    else if (x >= max) {
      x = max - ((x+2) - max);
    }
    return x;
  }

}

export { BlurJS };