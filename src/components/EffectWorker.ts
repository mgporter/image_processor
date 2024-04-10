import { EffectType } from "../effects/EffectType";
import { blurEffect } from "../effects/BlurEffect";
import { EffectResult, EffectWorkerResult } from "./ImageHolder";

const scope = (self as unknown) as Worker;

scope.onmessage = async (e) => {

  const perfStart = performance.now();

  let effectResult: EffectResult;
  
  switch((e.data.effectType as EffectType)) {
    case "blur": {
      effectResult = await blurEffect(e.data.buffer, e.data.width, e.data.height, e.data.values, e.data.useWasm);
      break;
    }
  }

  const perfEnd = performance.now() - perfStart;

  const effectWorkerResult: EffectWorkerResult = {
    result: effectResult.result,
    calcTime: effectResult.calcTime, 
    total: perfEnd,
  }

  scope.postMessage(effectWorkerResult, [effectResult.result.buffer]);
}