import { dispatcher } from "./Dispatcher";
import { Jimp, JimpConstructors } from "../jimptypes";

// @ts-expect-error Jimp is global object
const jimp = (window.Jimp as JimpConstructors);

class ImageHolder {

  private imageArrayBuffer: ArrayBuffer;
  private image: Jimp | null = null;

  constructor() {
    this.imageArrayBuffer = new Uint8Array(0);
  }

  containsImage() {
    return this.imageArrayBuffer != null;
  }

  async setImage(buffer: ArrayBuffer) {
    const image = await jimp.read(buffer as Buffer)
    this.image = image;
  }

  async getImageBuffer() {
    if (this.image == null) return null;
    return await this.image.getBufferAsync("image/jpeg");
  }

  async getBase64Buffer() {
    if (this.image == null) return null;
    return await this.image.getBase64Async("image/jpeg");
  }

  async applyEffect(effect: (buffer: Jimp) => Promise<Uint8Array>) {
    if (this.image == null) return null;
    const result = await effect(this.image);
    this.image.bitmap.data = (result as Buffer);
    dispatcher.dispatch<"updateView">("updateView", null);
  }


}

const imageHolder = new ImageHolder();

export { imageHolder };