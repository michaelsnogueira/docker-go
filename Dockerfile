FROM golang:1.21.0 AS builder

RUN mkdir hello && cd hello
COPY hello.go /go/hello
CMD [ "go", "run", "/go/hello/hello.go" ]


FROM golang:1.21.0-alpine
WORKDIR /go/hello
COPY --from=builder /go/hello .
CMD [ "go", "run", "/go/hello/hello.go" ]