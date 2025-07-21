#!/bin/bash
clear
rm -rf /root/update2.sh
export NC='\033[0m'
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export WHITE='\033[1;37m'

fun_bar() {
    local cmd1="$1"
    local cmd2="$2"

    (
        rm -f "$HOME/fim"
        if [[ -n "$cmd1" ]]; then
            eval "$cmd1" >/dev/null 2>&1
        fi
        if [[ -n "$cmd2" ]]; then
            eval "$cmd2" >/dev/null 2>&1
        fi
        touch "$HOME/fim"
    ) &
    local PID=$!

    tput civis
    echo -ne "  ${YELLOW}Harap Tunggu Loading ${WHITE}- ${YELLOW}["
    while kill -0 $PID 2>/dev/null; do
        for ((i = 0; i < 18; i++)); do
            echo -ne "${GREEN}#"
            sleep 0.1s
        done
        echo -e "${YELLOW}]"
        sleep 1s
        tput cuu1
        tput dl1
        echo -ne "  ${YELLOW}Harap Tunggu Loading ${WHITE}- ${YELLOW}["
    done
    echo -e "${YELLOW}]${WHITE} -${GREEN} OK !${WHITE}"
    tput cnorm
    rm -f "$HOME/fim"
}

res1() {
    clear
print_install "MEMASANG MENU PACKAGES"
wget -O ~/menu.zip "https://raw.githubusercontent.com/jaka2m/project/refs/heads/main/menu2/menu.zip" >/dev/null 2>&1
mkdir /root/menu
7z e -psumbawa ~/menu.zip -o/root/menu/ >/dev/null 2>&1
chmod +x /root/menu/*
mv /root/menu/* /usr/local/sbin/
#bzexe /usr/local/sbin/* && rm /usr/local/sbin/*~
echo ""
print_success "MENU PACKAGES"
}

echo -e "\033[96;1m╭══════════════════════════════════════════════════════════╮${NC}"
echo -e "\033[96;1m│$NC\033[41m                       UPDATE SCRIPT                      $NC\033[96;1m│$NC"
echo -e "\033[96;1m╰══════════════════════════════════════════════════════════╯${NC}"
echo -e ""
fun_bar "res1"
echo -e ""
echo -e "\033[96;1m╰══════════════════════════════════════════════════════════╯${NC}"
echo -e ""
read -n 1 -s -r -p "Tekan [ Enter ] untuk kembali ke menu"
menu
