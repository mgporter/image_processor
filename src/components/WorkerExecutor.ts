export type EffectType = "blur";

export interface EffectResult {
  calcTime: number;
  result: Uint8Array;
}

export interface EffectWorkerMessage {
  calcTime: number;
  totalTime: number;
  buffer: Uint8Array;
  options: EffectOptions;
  useWasm: boolean;
  imageWidth: number;
  imageHeight: number;
}

export interface EffectOptions {
  effectType: EffectType;
}

export interface BlurOptions extends EffectOptions {
  gaussianStdDev: number;
}


class WorkerExecutor {

  private effectWorker = new Worker(new URL("./EffectWorker.ts", import.meta.url), {type: 'module'});
  private loaderWorker = new Worker(new URL("./LoaderWorker.ts", import.meta.url), {type: "module"});

  constructor() {}

  getEffectWorker() {
    return this.effectWorker;
  }

  getLoaderWorker() {
    return this.loaderWorker;
  }

}

const workerExecutor = new WorkerExecutor();

export { workerExecutor };