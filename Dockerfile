ARG UBUNTU_VERSION=22.04

FROM ubuntu:$UBUNTU_VERSION as build

RUN apt-get update && \
    apt-get install -y build-essential git

WORKDIR /app

COPY . .

RUN make server

FROM ubuntu:$UBUNTU_VERSION as runtime

WORKDIR /app

COPY --from=build /app/server ./server
COPY --from=build /app/build-info.h ./build-info.h
COPY llama-2-7b.ggmlv3.q4_K_M.bin .

ENV LC_ALL=C.utf8

ENTRYPOINT ["/app/server", "-m", "llama-2-7b.ggmlv3.q4_K_M.bin"]
