import { useEffect, useState } from "react"
import { DispatcherMap, dispatcher } from "./Dispatcher";
import Clock from "./Clock";

const defaultResult: DispatcherMap["effectEnd"] = {
  type: "blur",
  method: "js",
  total: 0,
  calcTime: 0,
}

function timef(n: number) {
  return <span className="font-bold text-cyan-400">{n.toFixed(1)}</span>;
}

export default function EffectTimer() {

  const [showClock, setShowClock] = useState(false);
  const [showResults, setShowResults] = useState(false);
  const [result, setResult] = useState<DispatcherMap["effectEnd"]>(defaultResult);

  useEffect(() => {
    const unsubscribe = dispatcher.subscribe<"effectStart">("effectStart", startTimer);
    return unsubscribe;
  }, []);

  useEffect(() => {
    const unsubscribe = dispatcher.subscribe<"effectEnd">("effectEnd", onEffectEnd);
    return unsubscribe;
  }, []);

  function startTimer() {
    setShowClock(true);
    setShowResults(false);
  }

  function onEffectEnd(result: DispatcherMap["effectEnd"]) {
    setShowClock(false);
    setShowResults(true);
    setResult(result);
  }

  return (
    <div className="w-full min-h-24 flex flex-col items-center text-left gap-4">
      {showResults && 
      <div>
        <p>Effect type <span className="font-bold">{result.type}</span> took {timef(result.total)} ms when run using 
        {result.method === "js" ? " JavaScript." : " WebAssembly."}</p>
        <p className="text-sm mt-3">({timef(result.calcTime)} ms calculations + {timef(result.total - result.calcTime)} ms overhead)</p> 
      </div>
      }
    </div>
  )

}