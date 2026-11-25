#!/bin/bash

GREEN="\033[32m"
RED="\033[31m"
RESET="\033[0m"

CHECK_URL="https://IP.Check.Place"

run_check() {
    mode=$1
    name=$2

    echo -e "${GREEN}正在执行：${name}...${RESET}"

    case "$mode" in
        socks5)
            read -p "请输入 SOCKS5 (如 socks5://127.0.0.1:21080): " proxy
            bash <(curl -Ls "$CHECK_URL") -x $proxy
            ;;
        http)
            read -p "请输入 HTTP (如 http://127.0.0.1:21080): " proxy
            bash <(curl -Ls "$CHECK_URL") -x $proxy
            ;;
        "")
            bash <(curl -Ls "$CHECK_URL")
            ;;
        -4|-6)
            bash <(curl -Ls "$CHECK_URL") "$mode"
            ;;
    esac

    pause
}

pause() {
    read -p $'\033[32m按回车返回菜单...\033[0m'
    menu
}

menu() {
    clear
    echo -e "${GREEN}=============================${RESET}"
    echo -e "${GREEN}    ◈  IP 质量体检工具  ◈    ${RESET}"
    echo -e "${GREEN}=============================${RESET}"
    echo -e "${GREEN} 1) 双栈检测 (IPv4 + IPv6)${RESET}"
    echo -e "${GREEN} 2) 仅 IPv4${RESET}"
    echo -e "${GREEN} 3) 仅 IPv6${RESET}"
    echo -e "${GREEN}-----------------------------${RESET}"
    echo -e "${GREEN} 4) Socks5${RESET}"
    echo -e "${GREEN} 5) HTTP${RESET}"
    echo -e "${GREEN}-----------------------------${RESET}"
    echo -e "${GREEN} 6) 节点检测${RESET}"
    echo -e "${GREEN}-----------------------------${RESET}"
    echo -e "${GREEN} 0) 退出${RESET}"
    echo -e "${GREEN}=============================${RESET}"
    read -p $'\033[32m 请选择: \033[0m' choice

    case $choice in
        1) run_check "" "双栈检测" ;;
        2) run_check -4 "IPv4 检测" ;;
        3) run_check -6 "IPv6 检测" ;;
        4) run_check socks5 "SOCKS5 代理检测" ;;
        5) run_check http "HTTP 代理检测" ;;
        6) bash <(curl -sL https://raw.githubusercontent.com/guniangmeiyanruhua/GGBond-toolbox/main/toy/ipqualitys.sh) ;;
        0) exit 0 ;;
        *)
            echo -e "${RED}输入错误，请重新选择${RESET}"
            sleep 1
            menu
            ;;
    esac
}

menu
