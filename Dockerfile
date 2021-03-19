# Building apt-mirror from sources

FROM debian:buster-slim

RUN apt update && apt install gcc make perl wget --no-install-recommends -y

WORKDIR /centos-mirror
