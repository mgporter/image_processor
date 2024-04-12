import { dispatcher } from "./Dispatcher";
import { Jimp, JimpConstructors } from "../jimp";
import { EffectOptions, EffectWorkerMessage, WorkerExecutor } from "./WorkerExecutor";

// @ts-expect-error Jimp is global object
const jimp = (window.Jimp as JimpConstructors);

class ImageHolder {

  private imageArrayBuffer: ArrayBuffer;
  private image: Jimp | null = null;
  private name: string;
  private type: string;
  private extension: string;
  private workerExecutor: WorkerExecutor;

  constructor() {
    this.imageArrayBuffer = new Uint8Array(0);
    this.name = "";
    this.type = "";
    this.extension = "";
    this.workerExecutor = new WorkerExecutor();
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

  setFile(file: File) {
    let extdot = file.name.lastIndexOf(".");
    if (extdot == -1) extdot = file.name.length;

    this.name = file.name.substring(0, extdot);
    this.extension = file.name.substring(extdot+1);
    this.type = file.type;
  }

  getName() {
    return this.name;
  }

  getType() {
    return this.type;
  }

  getExtension() {
    return this.extension;
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
    return await this.image.getBase64Async(jimp.AUTO);
  }

  updateImageData(buffer: ArrayBuffer) {
    if (this.image != null) {
      this.image.bitmap.data = buffer as Buffer;
    }
  }

  applyEffect(options: EffectOptions, useWasm: boolean) {
    if (this.image == null) return null;

    const dispatch: EffectWorkerMessage = {
      buffer: this.image.bitmap.data,
      imageWidth: this.image.bitmap.width,
      imageHeight: this.image.bitmap.height,
      options: options,
      useWasm: useWasm,
      totalTime: -1,
      calcTime: -1,
    }

    this.workerExecutor.getInstance().onmessage = (e: MessageEvent<EffectWorkerMessage>) => {
      dispatcher.dispatch<"effectEnd">("effectEnd", e.data);
      this.updateImageData(e.data.buffer);
      dispatcher.dispatch<"updateView">("updateView", null);
    }

    // Start the worker
    dispatcher.dispatch<"effectStart">("effectStart", options.effectType);
    this.workerExecutor.getInstance().postMessage(dispatch, [this.image.bitmap.data.buffer]);

  }

}

const imageHolder = new ImageHolder();

export { imageHolder };