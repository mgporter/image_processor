import { EffectType } from "../effects/EffectType";

export interface EffectEnd {
  type: EffectType;
  method: "wasm" | "js";
  total: number;
  calcTime: number;
}

export type DispatcherEvent = keyof DispatcherMap;

export interface DispatcherMap {
  imageSelected: null;
  imageLoaded: {name: string, type: string, buffer: ArrayBuffer};
  imageReady: boolean;
  updateView: null;
  effectStart: EffectType;
  effectEnd: EffectEnd;
}

// eslint-disable-next-line
type DispatcherEventObj = Record<DispatcherEvent, ((arg: any) => void)[]>;

class Dispatcher {

  private Events: DispatcherEventObj = {
    imageLoaded: [],
    imageReady: [],
    updateView: [],
    imageSelected: [],
    effectStart: [],
    effectEnd: [],
  }
  
  constructor() {}

  subscribe<K extends keyof DispatcherMap>(event: K, callback: (arg: DispatcherMap[K]) => void) {
    this.Events[event].push(callback);
    return () => {this.Events[event].splice(this.Events[event].indexOf(callback), 1)};
  }

  dispatch<K extends keyof DispatcherMap>(event: K, data: DispatcherMap[K]) {
    console.log("DISPATCHER: " + event);
    this.Events[event].forEach(cb => cb(data));
  }

}

const dispatcher = new Dispatcher();

export { dispatcher };