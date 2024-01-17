#!/bin/bash
#MYIP=$(wget -qO- ipinfo.io/ip);
# // color
#GREENBO="\e[92;1m"
NC='\e[0m' # penutup
#BGGREEN="\033[42;37m" # hijau
#BGRED="\033[41;37m" # merah
#BGYELLOW="\033[43;37m" # kuning
#BGPURPLE="\033[45;37m" # ungu
grenbo="\e[92;1m"
NC='\033[0m'
clear
echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
echo -e "\033[1;93m│$NC\033[42m          MENU MANAGER VL                 $NC"
echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
echo -e "\033[1;93m│  ${grenbo}1.${NC} \033[0;36mCreate Vless${NC}"
echo -e "\033[1;93m│  ${grenbo}2.${NC} \033[0;36mTrial Vless${NC}"
echo -e "\033[1;93m│  ${grenbo}3.${NC} \033[0;36mExtend Vless${NC}"
echo -e "\033[1;93m│  ${grenbo}4.${NC} \033[0;36mDelete Vless${NC}"
echo -e "\033[1;93m│  ${grenbo}5.${NC} \033[0;36mCek Login Vless${NC}"
echo -e "\033[1;93m│  ${grenbo}0.${NC} \033[0;36mComeback${NC}"
echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
echo -e ""
read -p " Select menu :  "  opt
echo -e ""
case $opt in
1) clear ; add-vless ; exit ;;
2) clear ; trialvless ; exit ;;
3) clear ; renew-vless ; exit ;;
4) clear ; del-vless ; exit ;;
5) clear ; cek-vless ; exit ;;
0) clear ; menu ; exit ;;
x) exit ;;
*) echo "Anda salah tekan " ; sleep 1 ; menu-ssh ;;
esac
