#!/usr/bin/env bash
# Foundational setup shared by all project Pis (run by create_golden_image.sh)
set -euo pipefail

source "$(dirname "$0")/../utils/functions.sh"

log "Hardening SSH..."
sed -i 's/^#?PermitRootLogin.*/PermitRootLogin prohibit-password/' /etc/ssh/sshd_config
sed -i 's/^#?PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config
systemctl reload ssh

log "Configuring /etc/hosts aliases..."
cat >>/etc/hosts <<EOF
# Project mesh hostnames
100.100.100.1 rookery
100.100.100.2 raven1
100.100.100.3 raven2
100.100.100.4 raven3
100.100.100.5 raven4
100.100.100.6 raven5
100.100.100.7 raven6
100.100.100.8 raven7
100.100.100.9 raven8
EOF
