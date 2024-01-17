#!/bin/bash
# // izin
grenbo="\e[92;1m"
NC='\e[0m' # penutup
clear
echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
echo -e "\033[1;93m│$NC\033[42m          MENU MANAGER HOST               $NC"
echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
echo -e "\033[1;93m│  ${grenbo}1.${NC} \033[0;36mAdd Domain Host${NC}"
echo -e "\033[1;93m│  ${grenbo}2.${NC} \033[0;36mRenew Cert Domain${NC}"
echo -e "\033[1;93m│  ${grenbo}0.${NC} \033[0;36mComeback${NC}"
echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
echo -e ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; add-host ;;
2) clear ; certv2ray ;;
0) clear ; menu ;;
x) exit ;;
*) echo "Anda salah tekan" ; sleep 1 ; menu-domain ;;
esac
