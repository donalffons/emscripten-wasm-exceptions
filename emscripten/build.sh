mkdir -p build

# using -fwasm-exceptions
emcc \
  --bind embind-main.cpp \
  -s EXPORT_ES6=1 \
  -s USE_ES6_IMPORT_META=0 \
  -fwasm-exceptions \
  -Wl,--export=__cpp_exception \
  -o ./build/main.js

# using -fexceptions
# emcc \
#   --bind embind-main.cpp \
#   -s EXPORT_ES6=1 \
#   -s USE_ES6_IMPORT_META=0 \
#   -fexceptions \
#   -o ./build/main.js
