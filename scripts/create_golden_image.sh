#!/usr/bin/env bash
# Creates the base golden image for all Ravens & Rookery
set -euo pipefail

source "$(dirname "$0")/../utils/functions.sh"

if [[ $EUID -ne 0 ]]; then
    die "Run as root (sudo)."
fi

log "Updating system..."
apt-get update -y
apt-get install -y --no-install-recommends \
    curl wget gnupg lsb-release sudo \
    ntfy tailscale wireguard-tools \
    msmtp msmtp-mta netcat-openbsd \
    rsync git jq bc gzip

log "Enabling SSH..."
systemctl enable ssh

log "Installing Docker..."
curl -fsSL https://get.docker.com | sh
usermod -aG docker "$SUDO_USER"

log "Configuring ntfy..."
mkdir -p /etc/ntfy
cat >/etc/ntfy/server.yml <<EOF
base-url: https://ntfy.example.com
upstream-base-url: https://ntfy.sh
EOF

log "Pre‑loading SecLists wordlists..."
mkdir -p /opt/seclists
git clone --depth 1 https://github.com/danielmiessler/SecLists.git /opt/seclists

log "Downloading role‑specific bundle..."
curl -L https://example.com/role_specific_provisioning.sh -o /usr/local/sbin/role_specific_provisioning.sh
chmod +x /usr/local/sbin/role_specific_provisioning.sh

# Ensure one‑shot execution on next boot
cat >/etc/systemd/system/role-setup.service <<EOF
[Unit]
Description=One‑shot per‑host setup
After=multi-user.target

[Service]
Type=oneshot
ExecStart=/usr/local/sbin/role_specific_provisioning.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF
systemctl enable role-setup.service

log "Golden image creation complete. Power off, duplicate image, deploy!"
