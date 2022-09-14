FROM golang:1.14-buster as build-env

WORKDIR /go/src/app
ADD . /go/src/app

RUN CGO_ENABLED=0 go build -o /go/bin/snyket

FROM debian:buster-20220912
EXPOSE 8080
COPY --from=build-env /go/bin/snyket /usr/bin/snyket
CMD ["/usr/bin/snyket"]
