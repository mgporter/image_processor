export function addNumberCommas(num: number) {

  let numStr = num.toString();
  let output = "";

  while (numStr.length > 3) {
    output = "," + numStr.substring(numStr.length - 3) + output;
    numStr = numStr.substring(0, numStr.length - 3);
  }

  return numStr.length === 0 ? output : numStr + output;

}