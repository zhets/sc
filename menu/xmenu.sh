#!/bin/bash
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
 
vlx=$(grep -c -e "^#& " "/etc/xray/config.json")
let vla=$vlx/2
vmc=$(grep -c -e "^### " "/etc/xray/config.json")
let vma=$vmc/2
# VPS Information
tls_v2ray_status=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
nontls_v2ray_status=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
vless_tls_v2ray_status=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
vless_nontls_v2ray_status=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
#Domain
domain=$(cat /etc/xray/domain)
#Status certificate
modifyTime=$(stat $HOME/.acme.sh/${domain}_ecc/${domain}.key | sed -n '7,6p' | awk '{print $2" "$3" "$4" "$5}')
modifyTime1=$(date +%s -d "${modifyTime}")
currentTime=$(date +%s)
stampDiff=$(expr ${currentTime} - ${modifyTime1})
days=$(expr ${stampDiff} / 86400)
remainingDays=$(expr 90 - ${days})
tlsStatus=${remainingDays}
if [[ ${remainingDays} -le 0 ]]; then
	tlsStatus="expired"
fi
# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"

# STATUS SERVICE  TLS 
if [[ $tls_v2ray_status == "running" ]]; then 
   status_tls_v2ray=" ${GREEN}Running${NC} ( No Error )"
else
   status_tls_v2ray="${RED}  Not Running${NC}   ( Error )"
fi

# STATUS SERVICE NON TLS V2RAY
if [[ $nontls_v2ray_status == "running" ]]; then 
   status_nontls_v2ray=" ${GREEN}Running ${NC}( No Error )${NC}"
else
   status_nontls_v2ray="${RED}  Not Running ${NC}  ( Error )${NC}"
fi

# STATUS SERVICE VLESS HTTPS
if [[ $vless_tls_v2ray_status == "running" ]]; then
  status_tls_vless=" ${GREEN}Running${NC} ( No Error )"
else
  status_tls_vless="${RED}  Not Running ${NC}  ( Error )${NC}"
fi

# STATUS SERVICE VLESS HTTP
if [[ $vless_nontls_v2ray_status == "running" ]]; then
  status_nontls_vless=" ${GREEN}Running${NC} ( No Error )"
else
  status_nontls_vless="${RED}  Not Running ${NC}  ( Error )${NC}"
fi
# Download
#Download/Upload today
dtoday="$(vnstat -i eth0 | grep "today" | awk '{print $2" "substr ($3, 1, 1)}')"
utoday="$(vnstat -i eth0 | grep "today" | awk '{print $5" "substr ($6, 1, 1)}')"
ttoday="$(vnstat -i eth0 | grep "today" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload yesterday
dyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $2" "substr ($3, 1, 1)}')"
uyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $5" "substr ($6, 1, 1)}')"
tyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload current month
dmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $3" "substr ($4, 1, 1)}')"
umon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $6" "substr ($7, 1, 1)}')"
tmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $9" "substr ($10, 1, 1)}')"

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
