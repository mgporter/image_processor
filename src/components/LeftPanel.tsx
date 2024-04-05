import { ChangeEvent, useEffect, useRef, useState } from "react";
import { BlurImage } from "./BlurImage";
import { dispatcher } from "./Dispatcher";
import { imageHolder } from "./ImageHolder";
import { blurEffect } from "./BlurEffect";

// interface LeftPanelProps {
//   dispatcher: Dispatcher;
// }

export default function LeftPanel() {

  const [imageReady, setImageReady] = useState(false);

  useEffect(() => {
    dispatcher.subscribe<"imageReady">("imageReady", (status) => setImageReady(status));
  }, [])

  function handleFileSelection(e: ChangeEvent<HTMLInputElement>) {
    const file = e.target.files ? e.target.files[0] : null;
    if (!file || !file.type.startsWith("image")) return;
    const reader = new FileReader();

    reader.onload = 
      (e) => dispatcher.dispatch<"imageLoaded">("imageLoaded", e.target?.result as ArrayBuffer);

    reader.readAsArrayBuffer(file);
  }

  return (
    <aside className="leftpanel flex flex-col items-end gap-4">
      <input className="max-w-56" type="file" id="fileinput" onChange={handleFileSelection} />
      <button disabled={!imageReady} onClick={async () => imageHolder.applyEffect(blurEffect)}>Add blur</button>
    </aside>
  )

}