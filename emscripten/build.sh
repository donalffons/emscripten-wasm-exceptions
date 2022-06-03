mkdir -p build

# using -fwasm-exceptions
emcc \
  --bind embind-main.cpp \
  -s EXPORT_ES6=1 \
  -s USE_ES6_IMPORT_META=0 \
  -fwasm-exceptions \
  -s DEFAULT_LIBRARY_FUNCS_TO_INCLUDE=['$getExceptionMessage','$getCppExceptionThrownValue','$incrementExceptionRefcount','$decrementExceptionRefcount','$getCppExceptionTag'] \
  -s EXPORTED_FUNCTIONS=['getExceptionMessage','getCppExceptionThrownValue','getCppExceptionTag','___get_exception_message','___cpp_exception','___increment_wasm_exception_refcount','___decrement_wasm_exception_refcount'] \
  -D__USING_EMSCRIPTEN_EXCEPTION__ \
  -o ./build/main.js

# using -fexceptions
# emcc \
#   --bind embind-main.cpp \
#   -s EXPORT_ES6=1 \
#   -s USE_ES6_IMPORT_META=0 \
#   -fexceptions \
#   -o ./build/main.js
