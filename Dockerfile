FROM golang:1.14-alpine3.12 as build-env

WORKDIR /go/src/app
ADD . /go/src/app

RUN go build -o /go/bin/snyket

FROM alpine:3.12
EXPOSE 8080
COPY --from=build-env /go/bin/snyket /
CMD ["/snyket"]
