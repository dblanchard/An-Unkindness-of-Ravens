#!/usr/bin/env bash
# Performs host‑specific customisations on first boot only

set -euo pipefail
source "$(dirname "$0")/../utils/functions.sh"

read -rp "Enter new hostname (rookery, raven1‑8): " NEW_HOST
[[ -z $NEW_HOST ]] && die "Hostname required."
CURRENT_HOST=$(hostname)

log "Renaming $CURRENT_HOST ➜ $NEW_HOST"
sed -i "s/$CURRENT_HOST/$NEW_HOST/g" /etc/hostname /etc/hosts
hostname "$NEW_HOST"

case "$NEW_HOST" in
    rookery)
        log "Installing rookery‑specific services..."
        apt-get install -y docker-compose mosquitto
        # Additional coordinator setup here
        ;;
    raven*)
        log "Setting up field‑unit extras..."
        apt-get install -y hcxtools aircrack-ng
        ;;
    *)
        die "Unknown role."
esac

log "Tagging in Tailscale..."
tailscale up --hostname="$NEW_HOST" --advertise-tags="role:$NEW_HOST"

log "Disabling self..."
systemctl disable role-setup.service

log "Provisioning done. Rebooting..."
reboot
