import { dispatcher } from "./Dispatcher";
import { Jimp, JimpConstructors } from "../jimptypes";
import { EffectType } from "./EffectType";

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

  async applyEffect(effectType: EffectType, useWasm: boolean) {
    if (this.image == null) return null;
    
    // Use url string to allow passing in a TS file to worker. "Module" is needed to use import statements.
    const worker = new Worker(new URL("./EffectWorker.ts", import.meta.url), {type: 'module'});  

    // Handle worker's results
    worker.onmessage = (e) => {
      if (this.image == null) return null;
      this.image.bitmap.data = (e.data as Buffer);
      dispatcher.dispatch<"updateView">("updateView", null);
    }

    // Start the worker
    worker.postMessage({
      buffer: this.image.bitmap.data,
      width: this.image.bitmap.width,
      height: this.image.bitmap.height,
      effectType: effectType,
      useWasm: useWasm,
    }, [this.image.bitmap.data.buffer]);

  }


}

const imageHolder = new ImageHolder();

export { imageHolder };