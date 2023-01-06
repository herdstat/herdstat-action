#
# Copyright (c) 2023 - for information on the respective copyright owner
# see the NOTICE file and/or the repository https://github.com/herdstat/herdstat-action.
#
# SPDX-License-Identifier: MIT
#

# syntax=docker/dockerfile:1

# Build action image
FROM herdstat/herdstat:v0.2.0

CMD ["/herdstat", "-c", ".herdstat.yaml", "contribution-graph"]
