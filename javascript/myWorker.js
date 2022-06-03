import main from '/emscripten/build/main.js';

(async () => {
  const m = await main({
    locateFile: f => "/emscripten/build/main.wasm",
  });
  try {
    m.throwSomething();
  } catch (e) {
    // using -fwasm-exceptions
    console.log("e.is(m.asm.__cpp_exception)", e.is(m.asm.__cpp_exception));
    console.log("thrown value", m.getCppExceptionThrownValue(e)); // 5259312
    console.log("Exception Message 1:", m.getExceptionMessage(e)); // exception of type SomeException: Something went wrong
    console.log("Exception Message 2:", m.myGetExceptionMessage(m.getCppExceptionThrownValue(e))); // !! Uncaught (in promise) RuntimeError: memory access out of bounds

    // using -fexceptions
    // console.log("Exception Message:", m.getExceptionMessage(e));
  }
})();
