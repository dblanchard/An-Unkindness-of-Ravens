#!/usr/bin/env bash
# Common helper functions

set -euo pipefail

log()  { printf "\e[90m[%s] %s\e[0m\n" "$(date '+%F %T')" "$*" >&2; }
die()  { log "ERROR: $*"; exit 1; }

require_cmd() {
    command -v "$1" >/dev/null 2>&1 || die "Missing dependency: $1"
}
