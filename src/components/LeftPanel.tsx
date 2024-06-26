import { ChangeEvent, useRef, useState } from "react";
import { dispatcher } from "./Dispatcher";
import { imageHolder } from "./ImageHolder";
import EffectTimer from "./EffectTimer";
import useImage from "./useImage";
import RunHistory from "./RunHistory";
import BlurSlider from "./BlurSlider";
import { BlurOptions, workerExecutor } from "./WorkerExecutor";
import { addNumberCommas } from "./Utils";
import blackX from "../images/X_icon.svg"

const detailsProps = "font-bold text-amber-500";

const MAX_PIXELS = 8380000; // Beyond this, and the WASM module will not have enough memory. 

export default function LeftPanel() {

  const image = useImage();
  const [gaussianStdDev, setGaussianStdDev] = useState<number>(3);
  const [loadingError, setLoadingError] = useState<string | null>(null);
  const fileInputRef = useRef<HTMLInputElement>(null!);

  function handleFileSelection(e: ChangeEvent<HTMLInputElement>) {
    const file = e.target.files ? e.target.files[0] : null;
    fileInputRef.current.value = "";  // Needed so that selecting the same file twice also triggers onChange event
    if (!file) return;

    if (!file.type.startsWith("image")) {
      setLoadingError("File must be a valid image");
      return;
    }

    dispatcher.dispatch<"imageSelected">("imageSelected", null);

    workerExecutor.getLoaderWorker().onmessage = (e: MessageEvent<ArrayBuffer>) => {

      imageHolder.getImage(e.data).then((image) => {
        const pixels = image.getWidth() * image.getHeight();
        if (pixels > MAX_PIXELS) {
          setLoadingError(`Image is too large ( >${addNumberCommas(MAX_PIXELS)} pixels)`);
          dispatcher.dispatch<"imageReady">("imageReady", false);
        }
        else {
          imageHolder.setImage(image, file);
          dispatcher.dispatch<"imageReady">("imageReady", true);
        }

      });
    }

    workerExecutor.getLoaderWorker().postMessage(file);
  
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

  function closeLoadingError() {
    setLoadingError(null);
  }

  const disableControls = !image.ready || image.processing;
  const disableFileInput = image.loading || image.processing;

  return (
    <aside className="leftpanel flex flex-col items-stretch gap-4 pr-1 md:pr-4 ">
      <div className="flex items-stretch gap-4">
        <label htmlFor="fileinput" className={`button py-1 px-8 flex-grow-[2] border-2 border-slate-300 ${disableFileInput ? "disabled" : ""}`} >
          Select an image
          <input className="opacity-0 w-0 h-0" ref={fileInputRef} type="file" id="fileinput" accept="image/*" onChange={handleFileSelection} />
        </label>

        <button disabled={disableControls} className="py-1 px-4 flex-grow-[1]" onClick={handleFileDownload}>Save image...</button>
      </div>

      {loadingError != null && 
        <div className="flex items-center gap-2 mt-[-10px]">
          <p className="text-sm text-red-500 self-start">!!! {loadingError}</p>
          <button onClick={closeLoadingError} 
            className="w-4 h-4 p-0 m-0 rounded-lg flex justify-center items-center bg-red-800 hover:!bg-red-600 mt-[4px]">
            <img src={blackX} className="w-2 h-2 invert-[0.9]"></img>
          </button>
        </div>
      }

      <div className={`flex flex-col items-start text-left w-full font-["calibri"] ${image.ready ? "" : "opacity-50"}`}>
        <p><span className={detailsProps}>Name:</span> {image.ready ? imageHolder.getName() : ""}</p>
        <p><span className={detailsProps}>Type:</span> {image.ready ? imageHolder.getType() : ""}</p>
        <p><span className={detailsProps}>Dimensions:</span> {image.ready ? `${imageHolder.getWidth()} × ${imageHolder.getHeight()}` : ""}</p>
        <p><span className={detailsProps}>Pixels:</span> {image.ready ? addNumberCommas(imageHolder.getWidth() * imageHolder.getHeight()) : ""}</p>
      </div>

      <hr className="w-full h-2"/>

      <div className="flex lg:mx-6">
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