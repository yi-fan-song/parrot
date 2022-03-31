FROM golang:1.18-rc-bullseye

WORKDIR /go/src/parrot

COPY . .

RUN go mod tidy

ENTRYPOINT ["go", "build", "-o"]
CMD ["/out/parrot", "."]
