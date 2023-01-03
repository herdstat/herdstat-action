#
# Copyright (c) 2023 - for information on the respective copyright owner
# see the NOTICE file and/or the repository https://github.com/herdstat/herdstat-action.
#
# SPDX-License-Identifier: MIT
#

# syntax=docker/dockerfile:1

# Start by building the application.
FROM golang:1.19 as build

# Build libmergestat.so
RUN apt-get update && apt-get -y install cmake libssl-dev
RUN git clone --recurse-submodules https://github.com/mergestat/mergestat-lite.git
WORKDIR mergestat-lite
RUN git checkout v0.5.10
RUN make libgit2
RUN make .build/libmergestat.so

# Build herdstat
WORKDIR /
RUN git clone https://github.com/herdstat/herdstat.git
WORKDIR herdstat
RUN go mod download
RUN go build

# Build action image
FROM ubuntu:22.10

RUN apt-get update && apt-get install -y ca-certificates

# Copy over files from build phase
COPY --from=build /go/mergestat-lite/.build/libmergestat.so /
COPY --from=build /herdstat/herdstat /

CMD ["/herdstat", "-c", ".herdstat.yaml", "contribution-graph"]
