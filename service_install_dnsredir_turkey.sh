#!/bin/bash
source "$(dirname "$0")/scripts/common.sh"
check_root

title "GoodbyeDPI Turkey - Linux Kurulumu (Ana)"
info "Mod: Fragment=5 byte, TTL=5, DNS=Yandex (önerilen)"

build_binary
install_nft_script 1
create_service \
    "--fragment-size 5 --set-ttl 5 --dns-addr 77.88.8.8 --dns-port 1253 --dnsv6-addr 2a02:6b8::feed:0ff --dnsv6-port 1253 --queue-num 0" \
    1
configure_dns_yandex
start_service
print_status
