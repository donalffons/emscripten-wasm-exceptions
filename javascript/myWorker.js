import main from '/emscripten/build/main.js';

(async () => {
  const m = await main({
    locateFile: f => "/emscripten/build/main.wasm",
  });
  try {
    m.throwSomething();
  } catch (e) {
    // using -fwasm-exceptions
    console.log("Exception Message:", m.getExceptionMessage(e.getArg(m.asm.__cpp_exception, 0)));

    // using -fexceptions
    // console.log("Exception Message:", m.getExceptionMessage(e));
  }
})();
