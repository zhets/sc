#!/bin/bash
# MYIP=$(wget -qO- ipinfo.io/ip);
# // color
GREENBO="\e[92;1m"
NC='\e[0m' # penutup
BGGREEN="\033[42;37m" # hijau
BGRED="\033[41;37m" # merah
BGYELLOW="\033[43;37m" # kuning
BGPURPLE="\033[45;37m" # ungu
PR="\033[1;35m"
grenbo="\e[92;1m"
NC='\033[0m'
clear
echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
echo -e "\033[1;93m│$NC\033[42m          MENU MANAGER SSH                $NC"
echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
echo -e "\033[1;93m│  ${grenbo}1.${NC} \033[0;36mCreate SSH & OPENVPN${NC}"
echo -e "\033[1;93m│  ${grenbo}2.${NC} \033[0;36mTrial SSH & OPENVPN${NC}"
echo -e "\033[1;93m│  ${grenbo}3.${NC} \033[0;36mRenew SSH & OPENVPN${NC}"
echo -e "\033[1;93m│  ${grenbo}4.${NC} \033[0;36mDelet SHH & OPENVPN${NC}"
echo -e "\033[1;93m│  ${grenbo}5.${NC} \033[0;36mUser Login SSH & OPENVPN${NC}"
echo -e "\033[1;93m│  ${grenbo}6.${NC} \033[0;36mMember SSH & OPENVPN${NC}"
echo -e "\033[1;93m│  ${grenbo}7.${NC} \033[0;36mDell User SSH & OPENVPN${NC}"
echo -e "\033[1;93m│  ${grenbo}8.${NC} \033[0;36mAuto Kill SSH & OPENVPN${NC}"
echo -e "\033[1;93m│  ${grenbo}9.${NC} \033[0;36mMultiLogin SHH & OPENVPN${NC}"
echo -e "\033[1;93m│  ${grenbo}0.${NC} \033[0;36mBack To Menu${NC}"
echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
echo -e ""
read -p " Select menu :  "  opt
echo -e ""
case $opt in
1) clear ; usernew ; exit ;;
2) clear ; trial ; exit ;;
3) clear ; renew ; exit ;;
4) clear ; hapus ; exit ;;
5) clear ; cek ; exit ;;
6) clear ; member ; exit ;;
7) clear ; delete ; exit ;;
8) clear ; autokill ; exit ;;
9) clear ; ceklim ; exit ;;
0) clear ; menu ; exit ;;
x) exit ;;
*) echo "Anda salah tekan " ; sleep 1 ; menu-ssh ;;
esac
