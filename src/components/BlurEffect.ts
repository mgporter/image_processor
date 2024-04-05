import { Jimp } from "../jimptypes";
import { BlurImage } from "./BlurImage";

// @ts-expect-error Jimp is global object
const jimp = (window.Jimp as JimpConstructors);

export async function blurEffect(image: Jimp) {
  // blur with matrix: 0.05, 0.09, 0.12, 0.15, 0.16, 0.15, 0.12, 0.09, 0.05;

  const blurObj = new BlurImage(image.bitmap.data, image.bitmap.width, image.bitmap.height);
  return blurObj.blur([0.05, 0.09, 0.12, 0.15, 0.16, 0.15, 0.12, 0.09, 0.05]);

}