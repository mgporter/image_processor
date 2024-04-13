// This module was compiled with:
// emcc BlurWasmSrc.cpp -o BlurWasmSrc.js -s EXPORTED_FUNCTIONS='["_blur"]' -s IMPORTED_MEMORY=1 -s TOTAL_MEMORY=64MB -std=c++20 -O2

// #include <emscripten.h>
#include <math.h>
#include <vector>

struct Pixel {
  unsigned char red{};
  unsigned char green{};
  unsigned char blue{};
  unsigned char alpha{};
};

struct DoublePixel {
  double red{};
  double green{};
  double blue{};
  double alpha{};
};

struct Coordinate {
  int x{};
  int y{};
};

class BlurWasm {

  private:
  const int width;
  const int height;
  unsigned char* data;
  unsigned char* output;
  const int dataLength;
  const double* grid;
  const int gridLength;
  const int gridLengthHalf;

  public:
  BlurWasm(int w, int h, unsigned char* data_pointer, int dLength, double* grid, int grid_length )
    : width{w}                            // the width of the image
    , height{h}                           // the height of the image
    , data{data_pointer}                  // the start of the image data array
    , output{data_pointer + dLength}      // the start of an array to hold temporary image data for calculation
    , dataLength{dLength}                 // the length of the image data array
    , grid{grid}                          // the start of the array that holds the Gaussian values
    , gridLength{grid_length}             // the length of the array for the Gaussian values
    , gridLengthHalf{grid_length / 2} {}  // the length equal to half of the gridLength

  int doBlur() {

    // Do horizontal pass
    for (int px {0}; px < dataLength; px += 4) {

      Coordinate coord { indexToXY(px) };
      DoublePixel sumRGBA { 0,0,0,0 };

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
      DoublePixel sumRGBA { 0,0,0,0 };

      for (int j {0}; j < gridLength; j++ ) {
        int offset { j - gridLengthHalf };

        // Get pixels from output array
        addValuesToPixel(sumRGBA, getPixel(output, coord.x, coord.y + offset), grid[j]);
      }

      // Write result to data array
      setPixelFromIndex(data, sumRGBA, px);

    }

    return dataLength;

  }

  private:

  void addValuesToPixel(DoublePixel& pixel, const Pixel& valuesToAdd, const double amount) const {
    pixel.red += (valuesToAdd.red * amount);
    pixel.green += (valuesToAdd.green * amount);
    pixel.blue += (valuesToAdd.blue * amount);
    pixel.alpha += (valuesToAdd.alpha * amount);
  }

  Coordinate indexToXY(int i) const {
    i /= 4;
    return {i % width, i / width};
  }

  Pixel getPixelFromIndex(const unsigned char* arr, const int i) const {
    return {arr[i], arr[i+1], arr[i+2], arr[i+3]};
  }

  void setPixelFromIndex(unsigned char* arr, const DoublePixel& pixel, const int i) {
    arr[i] = static_cast<unsigned char>(pixel.red);
    arr[i+1] = static_cast<unsigned char>(pixel.green);
    arr[i+2] = static_cast<unsigned char>(pixel.blue);
    arr[i+3] = static_cast<unsigned char>(pixel.alpha);
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

  int blur(int w, int h, unsigned char* data_pointer, int dLength, double* grid, int grid_length) {
    BlurWasm blur{w, h, data_pointer, dLength, grid, grid_length};
    return blur.doBlur();
  }

}