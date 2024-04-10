const scope = (self as unknown) as Worker;

scope.onmessage = (fileMessage: MessageEvent<File>) => {

  const reader = new FileReader();

  reader.onload = (e) => {
    scope.postMessage(e.target?.result);
  }

  reader.readAsArrayBuffer(fileMessage.data);

}