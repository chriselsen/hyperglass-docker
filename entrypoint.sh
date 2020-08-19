#!/usr/bin/env bash
set -Eeuo pipefail

service redis-server start && /usr/local/bin/hyperglass start
