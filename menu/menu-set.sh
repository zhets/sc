#!/bin/bash
# // izin
#MYIP=$(wget -qO- ipinfo.io/ip);
# // color
grenbo="\e[92;1m"
NC='\e[0m' # penutup
clear
echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
echo -e "\033[1;93m│$NC\033[42m          MENU MANAGER                    $NC"
echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
echo -e "\033[1;93m│  ${grenbo}1.${NC} \033[0;36mDomain Manager${NC}"
echo -e "\033[1;93m│  ${grenbo}2.${NC} \033[0;36mChanges Port${NC}"
echo -e "\033[1;93m│  ${grenbo}3.${NC} \033[0;36mInstall Webmn${NC}"
echo -e "\033[1;93m│  ${grenbo}4.${NC} \033[0;36mSpeedTest${NC}"
echo -e "\033[1;93m│  ${grenbo}5.${NC} \033[0;36mDevelovers script${NC}"
echo -e "\033[1;93m│  ${grenbo}6.${NC} \033[0;36mSet Riset Server${NC}"
echo -e "\033[1;93m│  ${grenbo}7.${NC} \033[0;36mRestart All Serv${NC}"
echo -e "\033[1;93m│  ${grenbo}8.${NC} \033[0;36mChange Banner${NC}"
echo -e "\033[1;93m│  ${grenbo}9.${NC} \033[0;36mCek Bandwith${NC}"
echo -e "\033[1;93m│  ${grenbo}0.${NC} \033[0;36mComeback to Menu${NC}"
echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
echo -e ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; menu-domain ; exit ;;
2) clear ; port-change ; exit ;;
3) clear ; menu-webmin ; exit ;;
4) clear ; speedtest ; exit ;;
5) clear ; about ; exit ;;
6) clear ; auto-reboot ; exit ;;
7) clear ; restart ; exit ;;
8) clear ; nano /etc/issue.net ; exit ;; #ssh-vpn banner.conf
9) clear ; bw ; exit ;;
0) clear ; menu ; exit ;;
x) exit ;;
*) echo -e "" ; echo "Anda salah tekan" ; sleep 1 ; menu-set ;;
esac
