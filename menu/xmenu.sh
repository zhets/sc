#!/bin/bash
exitsc="\033[0m"
y="\033[1;93m"
j="\033[0;33m"
function lane() {
echo -e "${y}────────────────────────────────────────────${exitsc}"
}
url_izin="https://raw.githubusercontent.com/zhets/izinsc/main/ip"
ipsaya=$(curl -sS ipv4.icanhazip.com)
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
checking_sc() {
useexp=$(wget -qO- $url_izin | grep $ipsaya | awk '{print $3}')
if [[ $date_list < $useexp ]]; then
echo -ne
else
lane
echo -e "\033[42m          404 NOT FOUND AUTOSCRIPT          ${exitsc}"
lane
echo -e ""
echo -e "            \033[0;35mPERMISSION DENIED !${exitsc}"
echo -e "   ${j}Your VPS${exitsc} $ipsaya ${j}Has been Banned${exitsc}"
echo -e "     ${j}Buy access permissions for scripts${exitsc}"
echo -e "             ${j}Contact Admin :${exitsc}"
echo -e "      \033[0;36mWhatsapp${exitsc} wa.me/6285935195701"
lane
exit
fi
}
checking_sc
# Color Validation
DF='\e[39m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33m'
red='\e[31m'
green='\e[32m'
blue='\e[34m'
PURPLE='\e[35m'
cyan='\e[36m'
Lred='\e[91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
LIGHT='\033[0;37m'
BIB='\e[1;97;101m'
BIYellow='\033[1;93m'
BICyan='\033[1;96m'
 

clear
echo -e ""
echo -e "${BICyan}────────────────────────────────────────────────${NC}"
echo -e "\e[44;1;39m                 ⇱ XRAY VMESS ⇲                 ${NC}"
echo -e "${BICyan}────────────────────────────────────────────────${NC}"
echo -e ""
echo -e " ${cyan}1.${NC} Buat Akun Vmess"
echo -e " ${cyan}2.${NC} Trial Akun Vmess"
echo -e " ${cyan}3.${NC} Renew akun Vmess"
echo -e " ${cyan}4.${NC} Hapus Akun Vmess"
echo -e " ${cyan}5.${NC} Cek User Login Vmess"
echo -e "${BICyan}────────────────────────────────────────────────${NC}"
echo -e "\e[44;1;39m                 ⇱ XRAY VLESS ⇲                 ${NC}"
echo -e "${BICyan}────────────────────────────────────────────────${NC}"
echo -e ""
echo -e " ${cyan}6.${NC} Buat Akun Vless"
echo -e " ${cyan}7.${NC} Trial Akun Vless"
echo -e " ${cyan}8.${NC} Renew Akun Vless"
echo -e " ${cyan}9.${NC} Hapus Akun Vless"
echo -e "${cyan}10.${NC} Cek User Login Vless"
echo -e "${BICyan}────────────────────────────────────────────────${NC}" | lolcat
echo -e "  ${cyan}x.${NC} Exit Script "
echo -e "  ${cyan}0.${NC} Back To Menu "
echo -e "${BICyan}────────────────────────────────────────────────${NC}" | lolcat
echo -e ""
read -p " Select menu from options => [ 1 - 10 or 0 ] : " opt
case $opt in
1 | 01) clear ; add-ws ;;
2 | 02) clear ; trialvmess ;;
3 | 03) clear ; renew-ws ;;
4 | 04) clear ; del-ws ;;
5 | 05) clear ; cek-ws ;;
6 | 06) clear ; add-vless ;;
7 | 07) clear ; trialvless ;;
8 | 08) clear ; renew-vless ;;
9 | 09) clear ; del-vless ;;
10| 10) clear ; cek-vless ;;
0) clear ; menu ;;
x) exit ;;
*) xmenu ;;
esac
