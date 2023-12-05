FROM golang:1.21.0 AS builder

RUN mkdir hello
COPY hello.go /go/hello
RUN cd hello && go build -ldflags '-s -w' /go/hello/hello.go


FROM scratch
WORKDIR /go/hello
COPY --from=builder /go/hello .
CMD [ "./hello" ]