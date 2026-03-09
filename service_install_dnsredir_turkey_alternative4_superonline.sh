#!/bin/bash
source "$(dirname "$0")/scripts/common.sh"
check_root

title "GoodbyeDPI Turkey - Alternatif 4 SuperOnline (Fragment=5, DNS=Yandex)"
info "Mod: Fragment=5 byte, Fake=Kapalı, DNS=Yandex"

build_binary
install_nft_script 1
create_service \
    "--fragment-size 5 --no-fake --dns-addr 77.88.8.8 --dns-port 1253 --dnsv6-addr 2a02:6b8::feed:0ff --dnsv6-port 1253 --queue-num 0" \
    1
configure_dns_yandex
start_service
print_status
