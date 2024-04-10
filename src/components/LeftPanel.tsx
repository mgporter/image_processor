import { ChangeEvent } from "react";
import { dispatcher } from "./Dispatcher";
import { imageHolder } from "./ImageHolder";
import EffectTimer from "./EffectTimer";
import useImage from "./useImage";
import RunHistory from "./RunHistory";

function addNumberCommas(num: number) {

  let numStr = num.toString();
  let output = "";

  while (numStr.length > 3) {
    output = "," + numStr.substring(numStr.length - 3) + output;
    numStr = numStr.substring(0, numStr.length - 3);
  }

  return numStr.length === 0 ? output : numStr + output;

}

const detailsProps = "font-bold text-amber-500";

export default function LeftPanel() {

  const image = useImage();

  function handleFileSelection(e: ChangeEvent<HTMLInputElement>) {
    const file = e.target.files ? e.target.files[0] : null;
    if (!file || !file.type.startsWith("image")) return;

    dispatcher.dispatch<"imageSelected">("imageSelected", null);

    const worker = new Worker(new URL("./LoaderWorker.ts", import.meta.url), {type: "module"});

    worker.onmessage = (e: MessageEvent<ArrayBuffer>) => {
      imageHolder.setImage(e.data).then(() => {
        imageHolder.setName(file.name);
        imageHolder.setType(file.type);
        dispatcher.dispatch<"imageReady">("imageReady", true);
      });
    }

    worker.postMessage(file);
  
  }

  const disableControls = !image.ready || image.processing;
  const disableFileInput = image.loading || image.processing;

  return (
    <aside className="leftpanel flex flex-col items-end gap-4 pr-8">
      <label htmlFor="fileinput" className={`button self-center ${disableFileInput ? "disabled" : ""}`} style={{padding: "0.2rem 3rem"}}>
        Select an image
        <input className="opacity-0 w-0 h-0" type="file" id="fileinput" accept="image/*" onChange={handleFileSelection} />
      </label>

      <div className={`flex flex-col items-start text-left w-full font-["calibri"] ${image.ready ? "" : "opacity-50"}`}>
        <p><span className={detailsProps}>Name:</span> {image.ready ? imageHolder.getName() : ""}</p>
        <p><span className={detailsProps}>Type:</span> {image.ready ? imageHolder.getType() : ""}</p>
        <p><span className={detailsProps}>Dimensions:</span> {image.ready ? `${imageHolder.getWidth()} × ${imageHolder.getHeight()}` : ""}</p>
        <p><span className={detailsProps}>Pixels:</span> {image.ready ? addNumberCommas(imageHolder.getWidth() * imageHolder.getHeight()) : ""}</p>
      </div>

      <hr className="w-full h-2"/>

      <div className="flex mx-6">
        <button 
          className="rounded-l-lg rounded-r-none py-1 px-4 border-r-[1px] border-slate-400 w-1/2"
          disabled={disableControls} 
          onClick={() => imageHolder.applyEffect("blur", false)}>Blur with Javascript</button>
        <button 
          className="rounded-l-none rounded-r-lg py-1 px-4 w-1/2"
          disabled={disableControls} 
          onClick={() => imageHolder.applyEffect("blur", true)}>Blur with WebAssembly</button>
      </div>

      {image.ready && <EffectTimer />}

      {image.ready && <RunHistory />}

    </aside>
  )

}