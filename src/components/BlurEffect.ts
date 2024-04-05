import { BlurImage } from "./BlurImage";

// export async function blurEffect(image: Jimp) {
//   // blur with matrix: 0.05, 0.09, 0.12, 0.15, 0.16, 0.15, 0.12, 0.09, 0.05;
//   console.log(image);
//   const blurObj = new BlurImage(image.bitmap.data, image.bitmap.width, image.bitmap.height);
//   return blurObj.blur([0.05, 0.09, 0.12, 0.15, 0.16, 0.15, 0.12, 0.09, 0.05]);

// }

export function blurEffect(data: Uint8Array, width: number, height: number) {
  // blur with matrix: 0.05, 0.09, 0.12, 0.15, 0.16, 0.15, 0.12, 0.09, 0.05;

  const blurObj = new BlurImage(data, width, height);
  return blurObj.blur([0.05, 0.09, 0.12, 0.15, 0.16, 0.15, 0.12, 0.09, 0.05]);

}