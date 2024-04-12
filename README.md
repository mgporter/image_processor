# Image Processor

In development...

Web Workers
WASM modules from C++


WebAssembly allows the running of compiled languages in the browser at near native speeds. This example is meant to show off this speed increase by comparing it to the same operation performed in pure Javascript. The WebAssembly code (compiled from C++) and the Javascript code are nearly identical: both use a two-pass version of the gaussian blur algorithm to transform the image. Nonetheless, the WebAssembly implementation easily beats Javascript by a factor of 10 in most cases.

One issue with WebAssembly is memory management. In this particular example, I manage the WebAssembly memory manually in order to improve its efficiency. The bulk of the data is written directly to and read directly from the WebAssembly memory by both the JS host code and the C++ compiled code, requiring only pointers to the data to be passed as function parameters between the modules. Because of this, the WebAssembly code comes in at only 1,299 bytes. For more complex applications, however, this could be a risky approach. For this reason, Emscripten (the C++ to WebAssembly compiler) contains tools to manage reading/writing memory, at the cost of a greatly enlarged codebase.