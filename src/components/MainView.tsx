import { useRef } from "react";
import useImage from "./useImage";
import Clock from "./Clock";

export default function MainView() {

  const imageRef = useRef<HTMLImageElement>(null!);

  const image = useImage();

  return (
    <main className="mainview flex flex-col justify-start items-start pl-8">

      <div className={`w-full h-3/4 max-h-[800px] border-4 border-slate-500 
        flex items-center justify-center relative z-10 ${image.loading ? "loadingflash" : ""}
        overflow-hidden ${image.ready ? "hidden" : ""}`}>
        <p className="text-slate-500 text-2xl">
          {image.loading ? "Loading image pixels..." : "No image selected"}
        </p>
      </div>

      <div className="relative">
        <div id="mainimgcover" 
          className={`flex flex-col gap-2 font-["calibri"] font-extrabold z-20 absolute inset-0 pt-[min(45%,15rem)]
           bg-black/40 text-white/50 transition-opacity ${image.processing ? "opacity-100" : "opacity-0"}`}>
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