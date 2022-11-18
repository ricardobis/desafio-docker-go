FROM golang:1.16-alpine AS builder

WORKDIR /app

COPY ./appgo/main.go ./
COPY ./appgo/go.mod ./
COPY ./appgo/main ./

RUN go build .

FROM scratch
COPY --from=builder /app/main /app/main
ENTRYPOINT ["./app/main"]