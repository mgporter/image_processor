import { useCallback, useEffect, useRef, useState } from "react";
import { dispatcher } from "./Dispatcher";
import { imageHolder } from "./ImageHolder";

// interface MainViewProps {
//   dispatcher: Dispatcher;
// }

async function updateImageInHolder(buffer: ArrayBuffer) {
  imageHolder.setImage(buffer);
}

// const urlCreator = window.URL || window.webkitURL;
// const blob = new Blob([imageHolder.getImageBuffer()], {type: "image/jpeg"});
// const imageUrl = urlCreator.createObjectURL(blob);
// imageRef.current.src = imageUrl;

export default function MainView() {

  const imageRef = useRef<HTMLImageElement>(null!);
  const [imageReady, setImageReady] = useState(false);
  
  const setImage = useCallback((buffer: ArrayBuffer) => {
    imageHolder.setImage(buffer).then(() => {
      setImageReady(true);
      dispatcher.dispatch<"imageReady">("imageReady", true);
      updateView();
    })
  }, []);

  function updateView() {
    imageHolder.getBase64Buffer().then((buf) => {
      if (buf == null) return;
      imageRef.current.src = buf;
    })
  }

  useEffect(() => {
    dispatcher.subscribe<"imageLoaded">("imageLoaded", setImage);
  }, [setImage]);

  useEffect(() => {
    dispatcher.subscribe<"updateView">("updateView", updateView);
  }, []);

  return (
    <main className="mainview flex justify-center items-center">

      <div className={`w-1/2 h-3/4 border-4 border-slate-500 border-dashed 
        flex items-center justify-center ${imageReady ? "hidden" : ""}`}>
        <p className=" text-slate-500">No image selected yet..</p>
      </div>

      <img className={`max-h-[500px] max-w-[500px] ${imageReady ? "" : "hidden"}`} ref={imageRef} />

    </main>
  )

}