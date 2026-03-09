#!/bin/bash
source "$(dirname "$0")/scripts/common.sh"
check_root

title "GoodbyeDPI Turkey - Alternatif 3 SuperOnline (TTL=3, DNS=Yandex)"
info "Mod: Fake TTL=3, Fragment=Kapalı, DNS=Yandex"

build_binary
install_nft_script 1
create_service \
    "--no-fragment --set-ttl 3 --dns-addr 77.88.8.8 --dns-port 1253 --dnsv6-addr 2a02:6b8::feed:0ff --dnsv6-port 1253 --queue-num 0" \
    1
configure_dns_yandex
start_service
print_status
