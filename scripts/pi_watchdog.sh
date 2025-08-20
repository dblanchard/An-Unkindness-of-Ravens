#!/usr/bin/env bash
# Service watchdog & self‑heal

set -euo pipefail
source "$(dirname "$0")/../utils/functions.sh"

SELFTEST=false
[[ ${1:-} == "--selftest" ]] && SELFTEST=true

check() {
    systemctl is-active --quiet tailscaled || restart tailscaled
    systemctl is-active --quiet mosquitto || restart mosquitto
}

restart() {
    local svc=$1
    log "Restarting $svc"
    systemctl restart "$svc"
    ntfy send $NTFY_ERRORS_URL "$HOSTNAME: restarted $svc"
}

if $SELFTEST; then
    echo "Watchdog self‑test OK on $HOSTNAME"
    exit 0
fi

check
