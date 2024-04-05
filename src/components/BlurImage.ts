type Pixel = [number, number, number, number];
type Coordinate = [number, number];

class BlurImage {

  private data;
  private width;
  private height;

  constructor(data: Uint8Array, width: number, height: number) {
    this.data = data;
    this.width = width;
    this.height = height;
  }

  blur(grid: number[]): Uint8Array {
    let output = new Uint8Array(this.data.length);
    const halflength = Math.floor(grid.length / 2);

    // Do horizontal pass
    for (let px = 0; px < this.data.length; px += 4) {
      const [x, y] = this.indexToXY(px);
      const sumRGBA: Pixel = [0,0,0,0];

      for (let j = 0; j < grid.length; j++) {
        const offset = j - halflength;
        this.addValuesToPixel(sumRGBA, this.getPixel(x + offset, y), grid[j]);
      }

      this.setPixelFromIndex(output, sumRGBA, px);

    }

    this.data = output;
    output = new Uint8Array(this.data.length);

    // Do Vertical pass
    for (let px = 0; px < this.data.length; px += 4) {
      const [x, y] = this.indexToXY(px);
      const sumRGBA: Pixel = [0,0,0,0];

      for (let j = 0; j < grid.length; j++) {
        const offset = j - halflength;
        this.addValuesToPixel(sumRGBA, this.getPixel(x, y + offset), grid[j]);
      }

      this.setPixelFromIndex(output, sumRGBA, px);

    }

    return output;

  }

  addValuesToPixel(pixel: Pixel, valuesToAdd: Pixel, amount: number) {
    pixel.forEach((x, i) => pixel[i] += ( valuesToAdd[i] * amount) );
  }

  indexToXY(i: number): Coordinate {
    i /= 4;
    return [i % this.width, Math.floor(i / this.width)];
  }

  getPixelFromIndex(i: number): Pixel {
    return [this.data[i], this.data[i+1], this.data[i+2], this.data[i+3]];  // [R, G, B, A];
  }

  setPixelFromIndex(array: Uint8Array, pixel: Pixel, i: number): void {
    array[i] = pixel[0];
    array[i+1] = pixel[1];
    array[i+2] = pixel[2];
    array[i+3] = pixel[3];
  }

  getPixel(x: number, y: number): Pixel {
    const i = this.coordinatesToIndex(x, y);
    return this.getPixelFromIndex(i);
  }

  coordinatesToIndex(x: number, y: number): number {
    x = this.clampCoordinate(x, this.width);
    y = this.clampCoordinate(y, this.height);
    if (x >= this.width) x = this.width - ((x+2) - this.width);
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

export { BlurImage };