import { useState } from "react";

interface BlurSliderProps {
  setGaussianStdDev: (a: number) => void;
  active: boolean;
  gaussianStdDev: number;
}

export default function BlurSlider({setGaussianStdDev, active, gaussianStdDev}: BlurSliderProps) {

  return (
    <div className={`my-[-4px] ${active ? "" : "opacity-50"}`}>
      <p className="text-xs font-['Calibri'] text-left mb-[-4px]">
        Blur radius: {gaussianStdDev * 6 + 1} {gaussianStdDev === 0 ? "pixel" : "pixels"} (stdDev: {gaussianStdDev.toFixed(1)})
      </p>
      <input type="range" className="w-full h-1" defaultValue={3} min="0" max="10" step="0.5" list="ticks" disabled={!active}
        onChange={(e) => setGaussianStdDev(e.target.valueAsNumber)}></input>
      <datalist id="ticks" className="flex justify-between text-[0.5rem] pl-[4px] pr-[2px] text-gray-300 mt-[2px]">
        <option value="0" label="0" className="text-left"></option>
        <option value="1"></option>
        <option value="2"></option>
        <option value="3"></option>
        <option value="4"></option>
        <option value="5" label="5" className="text-center pl-[4px]"></option>
        <option value="6"></option>
        <option value="7"></option>
        <option value="8"></option>
        <option value="9"></option>
        <option value="10" label="10" className="text-right"></option>
      </datalist>
    </div>
  )
}