import { BlurOptions } from "../components/WorkerExecutor";
import { BlurJS } from "./BlurJS";
import { BlurWasm } from "./BlurWasm";

const gaussianCache: Record<number, number[]> = {}

function getGaussianArray(stdDevP: number) {

  // Get gaussian matrix values from cache, if available.
  if (gaussianCache[stdDevP] != undefined) return gaussianCache[stdDevP];

  // Make sure there is no value of 0.
  const stdDev = stdDevP === 0 ? 0.01 : stdDevP;

  // Do the calculations
  const valueAtZero = gaussian(0, stdDev);
  let gaussianArray = [valueAtZero];

  for (let x = 1, width = stdDev * 3; x <= width; x++) {
    const value = gaussian(x, stdDev);
    gaussianArray = [value, ...gaussianArray, value];
  }

  const normalizedArray = normalizeArray(gaussianArray);

  // Add the calculated value to the cache
  gaussianCache[stdDevP] = normalizedArray;

  return normalizedArray;

}

function gaussian(x: number, stdDev: number) {
  return (1/Math.sqrt(2*Math.PI*(stdDev*stdDev))) * Math.pow(Math.E, -((x*x)/(2*(stdDev*stdDev))));
}

function normalizeArray(arr: number[]) {
  const sum = arr.reduce((prev, cur) => {
    return prev + cur;
  });
  const inverse = 1 / sum;
  
  return arr.map(x => x * inverse);
}

export function blurEffect(data: Uint8Array, width: number, height: number, options: BlurOptions, useWasm: boolean) {

  const gaussianArray = getGaussianArray(options.gaussianStdDev);
  
  if (useWasm) {

    return BlurWasm(data, width, height, gaussianArray);

  } else {

    const blurObj = new BlurJS(data, width, height);
    return blurObj.blur(gaussianArray);

  }
  
}