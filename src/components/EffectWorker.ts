import { EffectType } from "./EffectType";
import { blurEffect } from "../effects/BlurEffect";

self.onmessage = async (e) => {

  let result: Uint8Array;
  switch((e.data.effectType as EffectType)) {
    case "blur": {
      result = await blurEffect(e.data.buffer, e.data.width, e.data.height, e.data.useWasm);
      break;
    }
  }

  // @ts-expect-error ts function signature for postMessage here is wrong
  self.postMessage(result, [result.buffer]);
}