# https://www.tensorflow.org/install/install_go

FROM golang:1.10

LABEL maintainer="Homin Lee <homin.lee@suapapa.net>"

# Change to "gpu" for GPU support
ENV TF_TYPE cpu
ENV TARGET_DIRECTORY /usr/local

RUN curl -L \
    https://storage.googleapis.com/tensorflow/libtensorflow/libtensorflow-${TF_TYPE}-$(go env GOOS)-x86_64-1.9.0.tar.gz | \
    tar -C $TARGET_DIRECTORY -xz
RUN ldconfig

RUN go get github.com/tensorflow/tensorflow/tensorflow/go
RUN go test github.com/tensorflow/tensorflow/tensorflow/go

WORKDIR /go/src/example
COPY example.go example.go