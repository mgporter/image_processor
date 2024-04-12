import { blurEffect } from "../effects/BlurEffect";
import { BlurOptions, EffectResult, EffectWorkerMessage } from "./WorkerExecutor";

const scope = (self as unknown) as Worker;



scope.onmessage = async (e: MessageEvent<EffectWorkerMessage>) => {

  const perfStart = performance.now();

  let effectResult: EffectResult;
  
  switch(e.data.options.effectType) {
    case "blur": {
      effectResult = await blurEffect(
        e.data.buffer, 
        e.data.imageWidth, 
        e.data.imageHeight, 
        (e.data.options as BlurOptions), 
        e.data.useWasm);
      break;
    }
  }

  const perfEnd = performance.now() - perfStart;

  const effectWorkerResult: EffectWorkerMessage = {
    options: e.data.options,
    useWasm: e.data.useWasm,
    buffer: effectResult.result,
    calcTime: effectResult.calcTime, 
    totalTime: perfEnd,
    imageWidth: e.data.imageWidth,
    imageHeight: e.data.imageHeight,
  }

  scope.postMessage(effectWorkerResult, [effectResult.result.buffer]);
}