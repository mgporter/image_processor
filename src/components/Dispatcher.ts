export type DispatcherEvent = keyof DispatcherMap;

interface DispatcherMap {
  imageLoaded: ArrayBuffer;
  imageReady: boolean;
  updateView: null;
}

// eslint-disable-next-line
type DispatcherEventObj = Record<DispatcherEvent, (arg: any) => void>;

class Dispatcher {

  private Events: DispatcherEventObj = {
    imageLoaded: () => {},
    imageReady: () => {},
    updateView: () => {},
  }
  
  constructor() {}

  subscribe<K extends keyof DispatcherMap>(event: K, callback: (arg: DispatcherMap[K]) => void) {
    this.Events[event] = callback;
  }

  dispatch<K extends keyof DispatcherMap>(event: K, data: DispatcherMap[K]) {
    const callback = this.Events[event];
    callback(data);
  }

}

const dispatcher = new Dispatcher();

export { dispatcher };