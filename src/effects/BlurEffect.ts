import { BlurJS } from "./BlurJS";
import { BlurWasm } from "./BlurWasm";


export function blurEffect(data: Uint8Array, width: number, height: number, useWasm: boolean) {
  // blur with matrix: 0.05, 0.09, 0.12, 0.15, 0.16, 0.15, 0.12, 0.09, 0.05;
  if (useWasm) {

    return BlurWasm(data, width, height);

  } else {

    const blurObj = new BlurJS(data, width, height);
    return blurObj.blur([0.05, 0.09, 0.12, 0.15, 0.18, 0.15, 0.12, 0.09, 0.05]);

  }
}