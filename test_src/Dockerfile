FROM alpine:latest

RUN apk update && apk add iperf3 iperf bash iproute2-tc

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]