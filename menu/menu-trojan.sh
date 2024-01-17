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
echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
echo -e "\033[1;93m│$NC\033[42m         MENU MANAGER TGF                 $NC"
echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
echo -e "\033[1;93m│  ${grenbo}1.${NC} \033[0;36mCreate TrojanGFW${NC}"
echo -e "\033[1;93m│  ${grenbo}2.${NC} \033[0;36mTrial TrojanGFW${NC}"
echo -e "\033[1;93m│  ${grenbo}3.${NC} \033[0;36mExtend TrojanGFW${NC}"
echo -e "\033[1;93m│  ${grenbo}4.${NC} \033[0;36mDelete Acount GFW${NC}"
echo -e "\033[1;93m│  ${grenbo}5.${NC} \033[0;36mCheck login TrojanGFW${NC}"
echo -e "\033[1;93m│  ${grenbo}5.${NC} \033[0;36mCheck Comeback To Menu${NC}"
echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
echo -e ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; add-tr ;;
2) clear ; trialtrojan ;;
3) clear ; renew-tr ;;
4) clear ; del-tr ;;
5) clear ; cek-tr ;;
0) clear ; menu ;;
x) exit ;;
*) echo "Boh salah tekan, Sayang kedak Babi" ; sleep 1 ; menu-trojan ;;
esac
