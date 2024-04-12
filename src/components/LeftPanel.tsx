import { ChangeEvent, useState } from "react";
import { dispatcher } from "./Dispatcher";
import { imageHolder } from "./ImageHolder";
import EffectTimer from "./EffectTimer";
import useImage from "./useImage";
import RunHistory from "./RunHistory";
import BlurSlider from "./BlurSlider";
import { BlurOptions } from "./WorkerExecutor";
import { addNumberCommas } from "./Utils";

const detailsProps = "font-bold text-amber-500";

export default function LeftPanel() {

  const image = useImage();
  const [gaussianStdDev, setGaussianStdDev] = useState<number>(3);

  function handleFileSelection(e: ChangeEvent<HTMLInputElement>) {
    const file = e.target.files ? e.target.files[0] : null;
    if (!file || !file.type.startsWith("image")) return;

    dispatcher.dispatch<"imageSelected">("imageSelected", null);

    const worker = new Worker(new URL("./LoaderWorker.ts", import.meta.url), {type: "module"});

    worker.onmessage = (e: MessageEvent<ArrayBuffer>) => {
      imageHolder.setImage(e.data).then(() => {
        imageHolder.setFile(file);
        dispatcher.dispatch<"imageReady">("imageReady", true);
      });
    }

    worker.postMessage(file);
  
  }

  function handleFileDownload() { 

    imageHolder.getBase64Buffer().then(data => {
      if (data == null) return;

      const element = document.createElement('a');
      element.href = data;
      element.download = `${imageHolder.getName()} blurred`;
      element.style.display = "none";
      document.body.appendChild(element);
      element.click();
      document.body.removeChild(element);
      
    });
    
  }

  function applyBlur(useWasm: boolean) {

    const options: BlurOptions = {
      effectType: "blur", 
      gaussianStdDev: gaussianStdDev,
    }

    imageHolder.applyEffect(options, useWasm);

  }

  const disableControls = !image.ready || image.processing;
  const disableFileInput = image.loading || image.processing;

  return (
    <aside className="leftpanel flex flex-col items-stretch gap-4 pr-8">
    <div className="flex gap-4 h-8">
      <label htmlFor="fileinput" className={`button self-center py-1 px-8 flex-grow-[2] border-2 border-slate-300 ${disableFileInput ? "disabled" : ""}`} >
        Select an image
        <input className="opacity-0 w-0 h-0" type="file" id="fileinput" accept="image/*" onChange={handleFileSelection} />
      </label>

      <button disabled={disableControls} className="py-1 px-4 flex-grow-[1]" onClick={handleFileDownload}>Save image...</button>
    </div>


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
          onClick={() => applyBlur(false)}>Blur with Javascript</button>
        <button 
          className="rounded-l-none rounded-r-lg py-1 px-4 w-1/2"
          disabled={disableControls} 
          onClick={() => applyBlur(true)}>Blur with WebAssembly</button>
      </div>

      <BlurSlider setGaussianStdDev={setGaussianStdDev} gaussianStdDev={gaussianStdDev} active={!disableControls} />

      {image.ready && <EffectTimer />}

      {image.ready && <RunHistory />}

    </aside>
  )

}