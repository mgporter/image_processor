import { BlurJS } from "./BlurJS";
import { BlurWasm } from "./BlurWasm";

export function blurEffect(data: Uint8Array, width: number, height: number, values: number[], useWasm: boolean) {
  
  if (useWasm) {

    return BlurWasm(data, width, height, values);

  } else {

    const blurObj = new BlurJS(data, width, height);
    return blurObj.blur(values);

  }
  
}