#!/bin/bash

#
# Copyright (c) 2023 - for information on the respective copyright owner
# see the NOTICE file and/or the repository https://github.com/herdstat/herdstat-action.
#
# SPDX-License-Identifier: MIT
#

# Fetches the version number of the latest release
get_latest_release() {
  curl -s "https://api.github.com/repos/herdstat/herdstat/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/'
}

# Initialize arguments
HERDSTAT_CLI_VERSION=$([ "$1" == "latest" ] && get_latest_release || echo "$1")
echo "Using version '${HERDSTAT_CLI_VERSION}' of herdstat CLI"
HERDSTAT_CONFIGURATION_FILE=$2
echo "Using configuration file at path '${HERDSTAT_CONFIGURATION_FILE}'"

# Download herdstat CLI
HERDSTAT_CLI_URL="https://github.com/herdstat/herdstat/releases/download/${HERDSTAT_CLI_VERSION}/herdstat-${HERDSTAT_CLI_VERSION}-linux-amd64.tar.gz"
echo "Downloading herdstat CLI from URL '${HERDSTAT_CLI_URL}'"
curl -sL "${HERDSTAT_CLI_URL}" | tar -xz

# Invoke herdstat with configuration read from file
echo "Invoking herdstat CLI"
./herdstat -c "${HERDSTAT_CONFIGURATION_FILE}" contribution-graph
