import { useEffect, useState } from "react"
import { DispatcherMap, dispatcher } from "./Dispatcher";
import Clock from "./Clock";

type EventTimingType = Pick<DispatcherMap["effectEnd"], "totalTime" | "calcTime" | "options" | "useWasm">

const defaultResult: EventTimingType = {
  options: {effectType: "blur"},
  useWasm: true,
  totalTime: 0,
  calcTime: 0,
}

function timef(n: number) {
  return <span className="font-bold text-cyan-400">{n.toFixed(1)}</span>;
}

export default function EffectTimer() {

  const [showClock, setShowClock] = useState(false);
  const [showResults, setShowResults] = useState(false);
  const [result, setResult] = useState<EventTimingType>(defaultResult);

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
        <p>Effect type <span className="font-bold">{result.options.effectType}</span> took {timef(result.totalTime)} ms when run using 
        {result.useWasm ? " WebAssembly." : " JavaScript." }</p>
        <p className="text-sm mt-3">({timef(result.calcTime)} ms calculations + {timef(result.totalTime - result.calcTime)} ms overhead)</p> 
      </div>
      }
    </div>
  )

}