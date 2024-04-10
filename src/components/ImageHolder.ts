import { dispatcher } from "./Dispatcher";
import { Jimp, JimpConstructors } from "../jimp";
import { EffectType } from "../effects/EffectType";

export interface EffectResult {
  calcTime: number;
  result: Uint8Array;
}

export interface EffectWorkerResult {
  calcTime: number;
  total: number;
  result: Uint8Array;
}

// @ts-expect-error Jimp is global object
const jimp = (window.Jimp as JimpConstructors);

class ImageHolder {

  private imageArrayBuffer: ArrayBuffer;
  private image: Jimp | null = null;
  private name: string;
  private type: string;

  constructor() {
    this.imageArrayBuffer = new Uint8Array(0);
    this.name = "";
    this.type = "";
  }

  containsImage() {
    return this.imageArrayBuffer != null;
  }

  getWidth() {
    return this.image ? this.image.bitmap.width : 0;
  }

  getHeight() {
    return this.image ? this.image.bitmap.height : 0;
  }

  setName(name: string) {
    this.name = name;
  }

  getName() {
    return this.name;
  }

  setType(type: string) {
    this.type = type;
  }

  getType() {
    return this.type;
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

  applyEffect(effectType: EffectType, useWasm: boolean) {
    if (this.image == null) return null;
    
    // Use url string to allow passing in a TS file to worker. "Module" is needed to use import statements.
    const worker = new Worker(new URL("./EffectWorker.ts", import.meta.url), {type: 'module'});  

    // Handle worker's results
    worker.onmessage = (e: MessageEvent<EffectWorkerResult>) => {
      if (this.image == null) return null;

      dispatcher.dispatch<"effectEnd">("effectEnd", {
        type: effectType,
        method: useWasm ? "wasm" : "js",
        total: e.data.total,
        calcTime: e.data.calcTime,
      });

      this.image.bitmap.data = (e.data.result as Buffer);
      dispatcher.dispatch<"updateView">("updateView", null);
    }

    dispatcher.dispatch<"effectStart">("effectStart", "blur");

    // Start the worker
    worker.postMessage({
      buffer: this.image.bitmap.data,
      width: this.image.bitmap.width,
      height: this.image.bitmap.height,
      values: [0.05, 0.09, 0.12, 0.15, 0.18, 0.15, 0.12, 0.09, 0.05],
      effectType: effectType,
      useWasm: useWasm,
    }, [this.image.bitmap.data.buffer]);

  }


}

const imageHolder = new ImageHolder();

export { imageHolder };