import { useRef } from "react";
import useImage from "./useImage";
import Clock from "./Clock";

// interface MainViewProps {
//   dispatcher: Dispatcher;
// }

// const urlCreator = window.URL || window.webkitURL;
// const blob = new Blob([imageHolder.getImageBuffer()], {type: "image/jpeg"});
// const imageUrl = urlCreator.createObjectURL(blob);
// imageRef.current.src = imageUrl;

export default function MainView() {

  const imageRef = useRef<HTMLImageElement>(null!);

  const image = useImage();

  return (
    <main className="mainview flex flex-col justify-start items-start pl-8">

      <div className={`w-full h-3/4 max-h-[800px] border-4 border-slate-500 border-dashed 
        flex items-center justify-center relative z-10 ${image.loading ? "loadingflash" : ""}
        overflow-hidden ${image.ready ? "hidden" : ""}`}>
        <p className="text-slate-500 text-2xl">
          {image.loading ? "Loading image pixels..." : "No image selected"}
        </p>
      </div>

      <div className="relative">
        <div id="mainimgcover" className={`flex flex-col gap-2 font-["calibri"] ${image.processing ? "processing" : ""}`}>
          <p className="text-2xl">Processing . . .</p>
          <Clock />
        </div>
          
        <img className=
          {`border-2 border-gray-200 z-10 ${image.ready ? "" : "hidden"}`}
          id="mainimg"
          ref={imageRef} 
          src={image.src} />
      </div>


      

    </main>
  )

}