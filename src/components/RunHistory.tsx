import { useEffect, useState } from "react";
import { EffectEnd, dispatcher } from "./Dispatcher";

export default function RunHistory() {

  const [history, setHistory] = useState<EffectEnd[]>([]);

  useEffect(() => {
    const unsubscribe = dispatcher.subscribe<"effectEnd">("effectEnd", (info) => {console.log("test"); setHistory(prev => [info, ...prev])});
    return unsubscribe;
  }, []);

  useEffect(() => {
    const unsubscribe = dispatcher.subscribe<"imageReady">("imageReady", () => setHistory([]));
    return unsubscribe;
  }, []);

  const maxTime = history.reduce((val, cur) => {
    return Math.max(val, cur.total);
  }, 0);

  return (
    <div className="flex flex-col self-start min-w-48 w-5/6 text-left gap-2">
      <p>Run History:</p>
      <hr className="w-full" />
      <ul className="text-sm whitespace-pre">
        {history.map((info, i) => {
          const percent = (info.total / maxTime) * 100;
          return <li key={i} className="flex">
            <div className="p-1 pr-3">{(history.length - (i)).toString().padStart(2, "0")}</div>
            <div className={`p-1 pl-2 ${info.method === "js" ? "bg-red-700" : "bg-blue-700"}`}
            style={{width: `${percent * .85}%`, overflow: "visible"}}>
              {info.method === "js" ? "JS      " : "Wasm"} &nbsp;
              {info.total.toFixed(1)} ms &nbsp;&nbsp;
              ({percent.toFixed(1)}%)</div>
          </li> 
        })}
      </ul>
    </div>
  )
}

// {backgroundImage: `linear-gradient(90deg, ${bg} ${percent-1}%, transparent ${percent})`}