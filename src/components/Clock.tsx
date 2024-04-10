import { useEffect, useState } from "react"
import { dispatcher } from "./Dispatcher";

export default function Clock() {

  const [ms, setMs] = useState(0);
  const [start, setStart] = useState(false);

  useEffect(() => {
    const unsubscribe = dispatcher.subscribe<"effectStart">("effectStart", () => {setMs(0); setStart(true)});
    return unsubscribe;
  }, []);

  useEffect(() => {
    const unsubscribe = dispatcher.subscribe<"effectEnd">("effectEnd", () => setStart(false));
    return unsubscribe;
  }, []);

  useEffect(() => {
    if (!start) return;

    const interval = setInterval(() => {
      setMs((prev) => prev += 0.01);
    }, 10);

    return () => {
      clearInterval(interval);
    }
  }, [start]);

  return (
    <div className="text-[3rem]">
      {ms.toFixed(2)} s
    </div>
  )
}