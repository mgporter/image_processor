import { useCallback, useEffect, useState } from "react";
import { imageHolder } from "./ImageHolder";
import { DispatcherMap, dispatcher } from "./Dispatcher";

export default function useImage() {

  const [ready, setReady] = useState(false);
  const [loading, setLoading] = useState(false);
  const [processing, setProcessing] = useState(false);
  const [src, setSrc] = useState("");

  const imageReady = useCallback((ready: DispatcherMap["imageReady"]) => {
    setReady(true);
    setLoading(false);

    if (ready) {

      imageHolder.getBase64Buffer().then((buf) => {
        if (buf == null) return;
        setProcessing(false);
        setSrc(buf);
      });

    } 
    else if (!imageHolder.containsImage()) {
      setReady(false);
    }

  }, []);

  useEffect(() => {
    const unsubscribe = dispatcher.subscribe<"effectStart">("effectStart", () => {setProcessing(true)});
    return unsubscribe;
  }, []);

  useEffect(() => {
    const unsubscribe = dispatcher.subscribe<"imageReady">("imageReady", imageReady);
    return unsubscribe;
  }, [imageReady]);

  useEffect(() => {
    const unsubscribe = dispatcher.subscribe<"updateView">("updateView", updateView);
    return unsubscribe;
  }, []);

  useEffect(() => {
    const unsubscribe = dispatcher.subscribe<"imageSelected">("imageSelected", onImageSelected);
    return unsubscribe;
  }, []);

  function updateView() {
    // The setTimeout here is a workaround to let the Clock finish updating the processing time.
    // If not set, then this operation will block the thread briefly, causing the Clock to stop,
    // and then run for a few more frames when updateView finishes
    setTimeout(() => {
      imageHolder.getBase64Buffer().then((buf) => {
        if (buf == null) return;
        setProcessing(false);
        setSrc(buf);
      });
    }, 25);
  }

  function onImageSelected() {
    setReady(false);
    setLoading(true);
  }

  return {
    ready,
    loading,
    processing,
    src,
  }


}