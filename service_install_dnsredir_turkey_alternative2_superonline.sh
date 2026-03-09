#!/bin/bash
source "$(dirname "$0")/scripts/common.sh"
check_root

title "GoodbyeDPI Turkey - Alternatif 2 SuperOnline (Fragment=5, DNS manuel)"
warn "Bu mod DNS yönlendirmesi yapmaz!"
warn "DNS'i manuel olarak 77.88.8.8 veya 1.1.1.1 yapın."
echo ""

build_binary
install_nft_script 0
create_service \
    "--fragment-size 5 --no-fake --queue-num 0" \
    0
start_service
print_status
