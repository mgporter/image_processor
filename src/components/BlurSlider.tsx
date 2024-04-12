import { useState } from "react";

interface BlurSliderProps {
  setGaussianMatrix: (a: number[]) => void;
  active: boolean;
}

export default function BlurSlider({setGaussianMatrix, active}: BlurSliderProps) {

  const [sliderValue, setSliderValue] = useState(3);

  function setGaussian() {
    const stdDev = sliderValue || 0.01;
    const valueAtZero = gaussian(0, stdDev);
    let gaussianArray = [valueAtZero];

    for (let x = 1, width = stdDev * 3; x <= width; x++) {
      const value = gaussian(x, stdDev);
      gaussianArray = [value, ...gaussianArray, value];
    }

    gaussianArray = normalizeArray(gaussianArray);

    setGaussianMatrix(gaussianArray);

  }

  function gaussian(x: number, stdDev: number) {
    return (1/Math.sqrt(2*Math.PI*(stdDev*stdDev))) * Math.pow(Math.E, -((x*x)/(2*(stdDev*stdDev))));
  }

  function normalizeArray(arr: number[]) {
    const sum = arr.reduce((prev, cur) => {
      return prev + cur;
    });
    const inverse = 1 / sum;
    
    return arr.map(x => x * inverse);
  }


  return (
    <div className={`my-[-4px] ${active ? "" : "opacity-50"}`}>
      <p className="text-xs font-['Calibri'] text-left mb-[-4px]">
        Blur radius: {sliderValue * 6 + 1} {sliderValue === 0 ? "pixel" : "pixels"} (stdDev: {sliderValue.toFixed(1)})
      </p>
      <input type="range" className="w-full h-1" defaultValue={3} min="0" max="10" step="0.5" list="ticks" disabled={!active}
        onPointerUp={setGaussian} onChange={(e) => setSliderValue(e.target.valueAsNumber)}></input>
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