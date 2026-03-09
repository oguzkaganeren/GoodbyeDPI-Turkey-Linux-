#!/bin/bash
set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

info()  { echo -e "${GREEN}[INFO]${NC} $*"; }
error() { echo -e "${RED}[ERROR]${NC} $*" >&2; }

if [[ $EUID -ne 0 ]]; then
    error "Root olarak çalıştırın: sudo bash $0"
    exit 1
fi

info "GoodbyeDPI Linux kaldırılıyor..."

systemctl stop goodbyedpi.service 2>/dev/null || true
systemctl disable goodbyedpi.service 2>/dev/null || true

nft delete table inet goodbyedpi 2>/dev/null || true

rm -f /etc/systemd/system/goodbyedpi.service
systemctl daemon-reload

rm -f /etc/systemd/resolved.conf.d/goodbyedpi.conf
systemctl restart systemd-resolved

info "GoodbyeDPI Linux başarıyla kaldırıldı."
info "Binary ve kaynak dosyalar /home/white/goodbyedpi-linux/ konumunda kalmaya devam ediyor."
