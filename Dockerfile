#
# Copyright (c) 2023 - for information on the respective copyright owner
# see the NOTICE file and/or the repository https://github.com/herdstat/herdstat-action.
#
# SPDX-License-Identifier: MIT
#

# syntax=docker/dockerfile:1

FROM ubuntu:23.04

RUN apt-get update && apt-get install -y curl ca-certificates --no-install-recommends

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
