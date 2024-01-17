#!/bin/bash
#MYIP=$(wget -qO- ipinfo.io/ip);
# // color
GREENBO="\e[92;1m"
NC='\e[0m' # penutup
BGGREEN="\033[42;37m" # hijau
BGRED="\033[41;37m" # merah
BGYELLOW="\033[43;37m" # kuning
BGPURPLE="\033[45;37m" # ungu
clear
grenbo="\e[92;1m"
NC='\033[0m'
echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
echo -e "\033[1;93m│$NC\033[42m          MENU MANAGER TR                 $NC"
echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
echo -e "\033[1;93m│  ${grenbo}1.)${NC} \033[0;36mCreating Trojan-GO${NC}"
echo -e "\033[1;93m│  ${grenbo}2.)${NC} \033[0;36mTrial Trojan-GO${NC}"
echo -e "\033[1;93m│  ${grenbo}3.)${NC} \033[0;36mExtend Trojan-GO${NC}"
echo -e "\033[1;93m│  ${grenbo}4.)${NC} \033[0;36mDelete Trojan-GO${NC}"
echo -e "\033[1;93m│  ${grenbo}5.)${NC} \033[0;36mCheck login Trojan-GO${NC}"
echo -e "\033[1;93m│  ${grenbo}0.)${NC} \033[0;36mComeback To Menu${NC}"
echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
echo -e ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; addtrgo ;;
2) clear ; trialtrojango ;;
3) clear ; renewtrgo ;;
4) clear ; deltrgo ;;
5) clear ; cektrgo ;;
0) clear ; menu ;;
x) exit ;;
*) echo "salah tekan" ; sleep 1 ; menu-trojan ;;
esac
