#!/usr/bin/env bash
# Configure smart‑plug running Tasmota for remote power reset

set -euo pipefail
source "$(dirname "$0")/../utils/functions.sh"

TASMOTA_IP=${1:?Usage: $0 <plug‑ip>}

# Set Wi‑Fi SSIDs list
curl -s "http://$TASMOTA_IP/cm?cmnd=backlog%20SSId1%20PiNet;SSId2%20ExecRouter" >/dev/null

# Configure MQTT broker (Pi local)
curl -s "http://$TASMOTA_IP/cm?cmnd=Backlog%20MqttHost%20$HOSTNAME;MqttPort%201888" >/dev/null

log "Tasmota configured for $TASMOTA_IP"
