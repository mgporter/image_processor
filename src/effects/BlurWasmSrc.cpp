//// emcc BlurWasmSrc.cpp -s WASM=1 -s MODULARIZE=1 -s ASSERTIONS -lembind -o BlueWasmSrc.js --embind-emit-tsd BlurWasmSrc.d.ts

// emcc BlurWasmSrc.cpp -o BlurWasmSrc.js -s EXPORTED_FUNCTIONS='["_blur"]' -s IMPORTED_MEMORY=1 -s TOTAL_MEMORY=64MB -std=c++20 -Os
#include <emscripten.h>
// #include <utility>
#include <math.h>
// // #include <vector>

// use std::cmp_equal / cmp_not_equal / cmp_less / cmp_greater / cmp_less_equal / cmp_greater_equal

struct Pixel {
  unsigned char red{};
  unsigned char green{};
  unsigned char blue{};
  unsigned char alpha{};

  // Pixel operator+(const Pixel& pixel) const {
  //   return Pixel(
  //     red + pixel.red,
  //     green + pixel.green,
  //     blue + pixel.blue,
  //     alpha + pixel.alpha);
  // }

};

struct Coordinate {
  int x{};
  int y{};
};

class BlurWasm {

  private:
  int width;
  int height;
  unsigned char* data;
  const int dataLength;

  public:
  BlurWasm(int w, int h, unsigned char* d, int l)
    : width{w}
    , height{h}
    , data{d}
    , dataLength{l} {}

  int doBlur() {
    
    unsigned char* output = data + dataLength;
    unsigned char* output2 = output + dataLength;

    double grid[9];
    grid[0] = 0.05;
    grid[1] = 0.09;
    grid[2] = 0.12;
    grid[3] = 0.15;
    grid[4] = 0.18;
    grid[5] = 0.15;
    grid[6] = 0.12;
    grid[7] = 0.09;
    grid[8] = 0.05;

    int gridLength{ 9 };
    int gridLengthHalf{ 4 };

    // Do horizontal pass
    for (int px {0}; px < dataLength; px += 4) {

      Coordinate coord { indexToXY(px) };
      Pixel sumRGBA { 0,0,0,0 };

      for (int j {0}; j < gridLength; j++ ) {
        int offset { j - gridLengthHalf };

        // Get pixels from data array
        addValuesToPixel(sumRGBA, getPixel(data, coord.x + offset, coord.y), grid[j]);
      }

      // Write result to output array
      setPixelFromIndex(output, sumRGBA, px);

    }

    // Do vertical pass
    for (int px {0}; px < dataLength; px += 4) {

      Coordinate coord { indexToXY(px) };
      Pixel sumRGBA { 0,0,0,0 };

      for (int j {0}; j < gridLength; j++ ) {
        int offset { j - gridLengthHalf };

        // Get pixels from output array
        addValuesToPixel(sumRGBA, getPixel(output, coord.x, coord.y + offset), grid[j]);
      }

      // Write result to data array
      setPixelFromIndex(output2, sumRGBA, px);

    }

    return dataLength;

  }

  void addValuesToPixel(Pixel& pixel, const Pixel& valuesToAdd, const double amount) const {
    pixel.red += (valuesToAdd.red * amount);
    pixel.green += (valuesToAdd.green * amount);
    pixel.blue += (valuesToAdd.blue * amount);
    pixel.alpha += (valuesToAdd.alpha * amount);
  }

  Coordinate indexToXY(int i) const {
    i /= 4;
    return {i % width, i / width};
  }

  Pixel getPixelFromIndex(unsigned char* arr, const int i) const {
    return {arr[i], arr[i+1], arr[i+2], arr[i+3]};
  }

  void setPixelFromIndex(unsigned char* arr, const Pixel& pixel, const int i) {
    arr[i] = pixel.red;
    arr[i+1] = pixel.green;
    arr[i+2] = pixel.blue;
    arr[i+3] = pixel.alpha;
  }

  Pixel getPixel(unsigned char* arr, int x, int y) {
    int i = coordinatesToIndex(x, y);
    return getPixelFromIndex(arr, i);
  }

  int coordinatesToIndex(int x, int y) {
    x = clampCoordinate(x, width);
    y = clampCoordinate(y, height);
    return ((x % width) + (y * width)) * 4;
  }

  // Clamp the coordinate so that if it exceeds the bounds, it goes back towards center.
  int clampCoordinate(int x, const int max) {
    if (x < 0) x = abs(x);
    else if (x >= max) x = max - ((x + 2) - max);
    return x;
  }

};

extern "C" {

  // int main() { return 0; }

  int blur(int width, int height, unsigned char *arr, int length) {
    BlurWasm blur{width, height, arr, length};
    return blur.doBlur();
  }

}