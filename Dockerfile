FROM golang:1.18.3-alpine3.16 as builder

RUN mkdir /app

COPY . /app

WORKDIR /app

RUN CGO_ENABLED=0 go build -o binary .

RUN chmod +x /app/binary

FROM alpine:latest

RUN mkdir /app

COPY --from=builder /app/binary /app

CMD [ "/app/binary" ]