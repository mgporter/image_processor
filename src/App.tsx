import './App.css'
import LeftPanel from './components/LeftPanel'
import MainView from './components/MainView'

export default function App() {

  // function loadNewImage(buffer: ArrayBuffer) {

  //   // blur with matrix: 0.05, 0.09, 0.12, 0.15, 0.16, 0.15, 0.12, 0.09, 0.05;
  
  //   Jimp.read(buffer).then((image) => {
  //     // console.log(image);
  //     const original: Uint8Array = image.bitmap.data;
  
  //     const blur = new BlurImage(original, image.bitmap.width, image.bitmap.height);
      
  //     blur.blurAsync([0.05, 0.09, 0.12, 0.15, 0.16, 0.15, 0.12, 0.09, 0.05])
  //       .then((output) => {
  //         image.bitmap.data = output;
  //         image.getBufferAsync(Jimp.AUTO).then((buf) => setImage(buf));
  //       })
  
  //   });
  // }


  return (
    <>
      <LeftPanel />
      <MainView />
    </>
  )
}
