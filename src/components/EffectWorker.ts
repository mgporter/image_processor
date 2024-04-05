import { EffectType } from "./EffectType";
import { blurEffect } from "./BlurEffect";

self.onmessage = (e) => {

  let result: Uint8Array;
  switch((e.data.effectType as EffectType)) {
    case "blur": {
      result = blurEffect(e.data.buffer, e.data.width, e.data.height);
    }
  }

  // @ts-expect-error ts function signature for postMessage here is wrong
  self.postMessage(result, [result.buffer]);
}