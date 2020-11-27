FROM golang:1.14-buster as build-env

WORKDIR /go/src/app
ADD . /go/src/app

RUN go build -o /go/bin/snyket

FROM debian:10-slim
EXPOSE 8080
COPY --from=build-env /go/bin/snyket /
CMD ["/snyket"]
