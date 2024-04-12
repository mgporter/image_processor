import { ChangeEvent, MouseEvent, useState } from "react";
import { dispatcher } from "./Dispatcher";
import { imageHolder } from "./ImageHolder";
import EffectTimer from "./EffectTimer";
import useImage from "./useImage";
import RunHistory from "./RunHistory";
import BlurSlider from "./BlurSlider";

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

const DEFAULT_GAUSSIAN_MATRIX = [0.06475879783294587, 0.12098536225957168, 0.17603266338214976, 0.19947114020071635, 0.17603266338214976, 0.12098536225957168, 0.06475879783294587];

export default function LeftPanel() {

  const image = useImage();
  const [gaussianMatrix, setGaussianMatrix] = useState<number[]>(DEFAULT_GAUSSIAN_MATRIX);

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

  function handleFileDownload() { 

    imageHolder.getBase64Buffer().then(data => {
      if (data == null) return;

      const element = document.createElement('a');
      element.href = data;
      element.download = "test_file";
      element.style.display = "none";
      document.body.appendChild(element);
      element.click();
      document.body.removeChild(element);
      
    });
    
  }

  const disableControls = !image.ready || image.processing;
  const disableFileInput = image.loading || image.processing;

  imageHolder.getBase64Buffer().then(x => console.log(x));

  return (
    <aside className="leftpanel flex flex-col items-stretch gap-4 pr-8">
      <label htmlFor="fileinput" className={`button self-center ${disableFileInput ? "disabled" : ""}`} style={{padding: "0.2rem 3rem"}}>
        Select an image
        <input className="opacity-0 w-0 h-0" type="file" id="fileinput" accept="image/*" onChange={handleFileSelection} />
      </label>

      <button onClick={handleFileDownload}>DOWNLOAD</button>

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
          onClick={() => imageHolder.applyEffect("blur", gaussianMatrix, false)}>Blur with Javascript</button>
        <button 
          className="rounded-l-none rounded-r-lg py-1 px-4 w-1/2"
          disabled={disableControls} 
          onClick={() => imageHolder.applyEffect("blur", gaussianMatrix, true)}>Blur with WebAssembly</button>
      </div>

      <BlurSlider setGaussianMatrix={setGaussianMatrix} active={!disableControls} />

      {image.ready && <EffectTimer />}

      {image.ready && <RunHistory />}

    </aside>
  )

}