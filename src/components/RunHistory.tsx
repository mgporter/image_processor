import { useEffect, useState } from "react";
import { dispatcher } from "./Dispatcher";
import { BlurOptions, EffectWorkerMessage } from "./WorkerExecutor";

export default function RunHistory() {

  const [history, setHistory] = useState<EffectWorkerMessage[]>([]);

  useEffect(() => {
    const unsubscribe = dispatcher.subscribe<"effectEnd">("effectEnd", (info) => {setHistory(prev => [info, ...prev])});
    return unsubscribe;
  }, []);

  useEffect(() => {
    const unsubscribe = dispatcher.subscribe<"imageReady">("imageReady", () => setHistory([]));
    return unsubscribe;
  }, []);

  const maxTime = history.reduce((val, cur) => {
    return Math.max(val, cur.totalTime);
  }, 0);

  return (
    <div className="flex flex-col self-start min-w-48 w-5/6 text-left gap-2">
      <p>Run History:</p>
      <hr className="w-full" />
      <ul className="text-sm whitespace-pre">
        {history.map((info, i) => {
          const percent = (info.totalTime / maxTime) * 100;
          return <li key={i} className="flex">
            <div className="p-1 pr-3">{(history.length - (i)).toString().padStart(2, "0")}</div>
            <div className={`p-1 pl-2 ${info.useWasm ? "bg-blue-700" : "bg-red-700"}`}
            style={{width: `${percent * .85}%`, overflow: "visible"}}>
              {info.useWasm ? "Wasm " : "JS "}
              <span className="text-xs">
                (StdDev: {(info.options as BlurOptions).gaussianStdDev}) &nbsp;  
                {info.totalTime.toFixed(1)} ms &nbsp;
              </span>
            </div>
          </li> 
        })}
      </ul>
    </div>
  )
}