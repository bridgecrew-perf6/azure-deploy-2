FROM golang:1.17 

WORKDIR /go/src
COPY api-server /go/src

RUN go mod tidy \
  && go build

ENV CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64

EXPOSE 80

CMD ["go", "run", "server.go"]
