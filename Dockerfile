FROM emscripten/emsdk:3.1.10

# RUN \
#   emsdk update-tags && \
#   emsdk install tot && \
#   emsdk activate tot

WORKDIR /app/

ENTRYPOINT [ "./run.sh" ]
