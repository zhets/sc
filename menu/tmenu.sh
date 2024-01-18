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
NC='\e[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
LIGHT='\033[0;37m'
# VPS Information

clear
echo -e "${BIYellow}┌─────────────────────────────────────────────────┐${NC}"
echo -e "${BIYellow}│ ${BIB}                  • TROJAN •                    ${NC} ${BIYellow}│${NC}"
echo -e "${BIYellow}└─────────────────────────────────────────────────┘${NC}"
echo -e ""
echo -e " \e[36m•x\e[0m Exit Script "
echo -e " \e[36m•0\e[0m Back To Menu "
echo -e "${BICyan}────────────────────────────────────────────────${NC}"
echo -e " \e[44;1;39m                   ⇱ TROJAN WS ⇲               ${NC}"
echo -e "${BICyan}────────────────────────────────────────────────${NC}"
echo -e ""
echo -e "   \e[36m1.)\e[0m] Buat Akun Trojan Ws"
echo -e "   \e[36m2.)\e[0m] Trial Akun Trojan Ws"
echo -e "   \e[36m3.)\e[0m] Renew Akun Trojan Ws"
echo -e "   \e[36m4.)\e[0m] Hapus Akun Trojan Ws"
echo -e "   \e[36m5.)\e[0m] Cek User Login Trojan Ws"
echo -e "${BICyan}────────────────────────────────────────────────${NC}"
echo -e " \e[44;1;39m                   ⇱ TROJAN GO ⇲               ${NC}"
echo -e "${BICyan}────────────────────────────────────────────────${NC}"
echo -e ""
echo -e "   \e[36m6.)\e[0m Buat Akun Trojan Go"
echo -e "   \e[36m7.)\e[0m Trial Akun Trojan Go"
echo -e "   \e[36m8.)\e[0m Renew Akun Trojan Go"
echo -e "   \e[36m9.)\e[0m Hapus Akun Trojan Go"
echo -e "   \e[36m10)\e[0m Cek User Login Trojan Go"
echo -e "${BICyan}────────────────────────────────────────────────${NC}"
echo -e ""
read -p " Select menu :  "  opt
case $opt in
1) clear ; add-tr ;;
2) clear ; trialtrojan ;;
3) clear ; renew-tr ;;
4) clear ; del-tr ;;
5) clear ; cek-tr ;;
6) clear ; addtrgo ;;
7) clear ; trialtrojango ;;
8) clear ; renewtrgo ;;
9) clear ; deltrgo ;;
10) clear ; cektrgo ;;
0) clear ; menu ;;
x) exit ;;
*) echo "Anda salah tekan " ; sleep 1 ; xmenu ;;
esac
