#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip)
# =========================================
# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"
DATE2=$(date -R | cut -d " " -f -5)
tram=$(free -m | awk 'NR==2 {print $2}')
uram=$(free -m | awk 'NR==2 {print $3}')
fram=$(free -m | awk 'NR==2 {print $4}')

username=$(curl -sS https://raw.githubusercontent.com/zhets/izinsc/main/ip | grep $MYIP | awk '{print $2}')
valid=$(curl -sS https://raw.githubusercontent.com/zhets/izinsc/main/ip | grep $MYIP | awk '{print $3}')
clear
# CERTIFICATE STATUS
d1=$(date -d "$valid" +%s)
d2=$(date -d "$today" +%s)
certifacate=$(((d1 - d2) / 86400))
# VPS Information
DATE=$(date +'%Y-%m-%d')
datediff() {
    d1=$(date -d "$1" +%s)
    d2=$(date -d "$2" +%s)
    echo -e "$COLOR1 $NC Expiry In   : $(( (d1 - d2) / 86400 )) Days"
}
mai="datediff "$Exp" "$DATE""

# Status Expired / Active
Info="(${green}Active${NC})"
Error="(${RED}Expired${NC})"
today=`date -d "0 days" +"%Y-%m-%d"`
Exp1=$(curl https://raw.githubusercontent.com/zhets/izinsc/main/ip | grep $MYIP | awk '{print $3}')
if [[ $today < $Exp1 ]]; then
sts="${Info}"
else
sts="${Error}"
fi
clear

vlx=$(grep -c -E "^#& " "/etc/xray/config.json")
let vla=$vlx/2
vmc=$(grep -c -E "^### " "/etc/xray/config.json")
let vma=$vmc/2
ssh1="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"

trx=$(grep -c -E "^#! " "/etc/xray/config.json")
let tra=$trx/2
ssx=$(grep -c -E "^## " "/etc/xray/config.json")
let ssa=$ssx/2
trg=$(grep -c -E "### " "/etc/trojan-go/akun.conf")
let trgo=$trg/2

# // Exporting Language to UTF-8
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White
BIB="\e[1;97;101m"        # Background
UWhite='\033[4;37m'       # White
On_IPurple='\033[0;105m'  #
On_IRed='\033[0;101m'
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White
Orange="\e[33m"           # Orange
r="\033[1;31m"            # Red Terang
w="\033[1;92m"            # Hijau Terang
NC='\e[0m'
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

# // Exporting Language to UTF-8

export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'


# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'

# // Export Banner Status Information
export EROR="[${RED} EROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"

# // Export Align
export BOLD="\e[1m"
export WARNING="${RED}\e[5m"
export UNDERLINE="\e[4m"

# // Clear
clear
export IP=$(curl ifconfig.me)
clear && clear && clear
clear;clear;clear
cek=$(service ssh status | grep active | cut -d ' ' -f5)
if [ "$cek" = "active" ]; then
stat=-f5
else
stat=-f7
fi
ssh=$(service ssh status | grep active | cut -d ' ' $stat)
if [ "$ssh" = "active" ]; then
ressh="${green}ON${NC}"
else
ressh="${red}OFF${NC}"
fi
sshstunel=$(service stunnel4 status | grep active | cut -d ' ' $stat)
if [ "$sshstunel" = "active" ]; then
resst="${green}ON${NC}"
else
resst="${red}OFF${NC}"
fi
sshws=$(service ws-stunnel status | grep active | cut -d ' ' $stat)
if [ "$sshws" = "active" ]; then
ressshws="${green}ON${NC}"
else
ressshws="${red}OFF${NC}"
fi
ngx=$(service nginx status | grep active | cut -d ' ' $stat)
if [ "$ngx" = "active" ]; then
resngx="${green}ON${NC}"
else
resngx="${red}OFF${NC}"
fi
dbr=$(service dropbear status | grep active | cut -d ' ' $stat)
if [ "$dbr" = "active" ]; then
resdbr="${green}ON${NC}"
else
resdbr="${red}OFF${NC}"
fi
v2r=$(service xray status | grep active | cut -d ' ' $stat)
if [ "$v2r" = "active" ]; then
resv2r="${green}ON${NC}"
else
resv2r="${red}OFF${NC}"
fi
clear
echo -e " ${BICyan}┌────────────────────────────────────────────────┐${NC}"
echo -e " ${BICyan}│ ${BIB}              FV STORE TUNNELING              ${NC}${BICyan} │${NC}"
echo -e " ${BICyan}└────────────────────────────────────────────────┘${NC}"
echo -e " ${BICyan}┌────────────────────────────────────────────────┐${NC}"
echo -e " ${BICyan}│${NC} OS            ${NC}:  "`hostnamectl | grep "Operating System" | cut -d ' ' -f5-`
echo -e " ${BICyan}│${NC} IP            ${NC}:  $IP"
echo -e " ${BICyan}│${NC} TOTAL RAM     ${NC}:  $tram MB"
#echo -e " ${BICyan}│${NC} SWAP RAM      ${NC}:  $MEMOFREE MB"
echo -e " ${BICyan}│${NC} ISP           ${NC}:  $(cat /root/.isp)" 
echo -e " ${BICyan}│${NC} CITY          ${NC}:  $(cat /root/.city)"
echo -e " ${BICyan}│${NC} DOMAIN        ${NC}:  $(cat /etc/xray/domain)"
echo -e " ${BICyan}│${NC} DATE & TIME   ${NC}:  $DATE2"
echo -e " ${BICyan}│${NC} UPTIME        ${NC}:  $uptime"
echo -e " ${BICyan}└────────────────────────────────────────────────┘${NC}"
echo -e " ${BICyan}┌────────────────────────────────────────────────┐${NC}"
echo -e " ${BICyan}│${NC}  ${BIYellow}SSH${GREEN}    ${BIYellow}VMESS${GREEN}    ${BIYellow}VLESS${GREEN}    ${BIYellow}TROJAN${GREEN}    ${BIYellow}TROJAN GO$NC"
echo -e " ${BICyan}│${NC}  ${Blue} $ssh1       $vma        $vla         $tra         $trgo    $NC"
echo -e " ${BICyan}└────────────────────────────────────────────────┘${NC}"
echo -e " ${BICyan} SSH ${NC}: $ressh"" ${BICyan} NGINX ${NC}: $resngx"" ${BICyan}  XRAY ${NC}: $resv2r"" ${BICyan} TROJAN ${NC}: $resv2r"
echo -e " ${BICyan}     STUNNEL ${NC}: $resst" "${BICyan} DROPBEAR ${NC}: $resdbr" "${BICyan} SSH-WS ${NC}: $ressshws"
echo -e " ${BICyan}┌────────────────────────────────────────────────┐${NC}"
echo -e " ${BICyan}│ ${BIB}                MENU TUNNELING                ${NC}${BICyan} │${NC}"
echo -e " ${BICyan}└────────────────────────────────────────────────┘${NC}"
echo -e " ${BICyan}┌────────────────────────────────────────────────┐${NC}"
echo -e " ${BICyan}│${NC} ${w}1.${NC}  >> SSH/UDP      ${w}4.${NC}  >> Backup"
echo -e " ${BICyan}│${NC} ${w}2.${NC}  >> XRAY         ${w}5.${NC}  >> Setting"
echo -e " ${BICyan}│${NC} ${w}3.${NC}  >> TROJAN       ${w}6.${NC}  >> Status Service"
echo -e " ${BICyan}│${NC} ${w}8.${NC}  >> Log Create   ${w}7.${NC}  >> Update Script"
echo -e " ${BICyan}└────────────────────────────────────────────────┘${NC}"
echo -e " ${BICyan}┌────────────────────────────────────────────────┐${NC}"
echo -e " ${BICyan}│${NC} ${BICyan}HARI ini${NC}: ${red}$ttoday$NC ${BICyan}KEMARIN${NC}: ${red}$tyest$NC ${BICyan}BULAN${NC}: ${red}$tmon$NC $NC"
echo -e " ${BICyan}└────────────────────────────────────────────────┘${NC}"
echo -e "        ${BICyan}┌─────────────────────────────────────┐${NC}"
echo -e "        ${BICyan}│$NC Version    : V1.01${NC}"
echo -e "        ${BICyan}│$NC Clent Name : $username ${NC}"
echo -e "        ${BICyan}│$NC Exp Script : $valid ${w}($r $certifacate${NC} ) Days${NC}"
echo -e "        ${BICyan}└─────────────────────────────────────┘${NC}"
echo -e   ""
read -p " Select menu : " opt
case $opt in
1|01) clear ; menu-ssh ;;
2|02) clear ; xmenu ;;
3|03) clear ; tmenu ;;
4|04) clear ; menu-backup ;;
5|05) clear ; menu-set ;;
6|06) clear ; running ;;
7|07) clear ; wget -q https://raw.githubusercontent.com/zhets/sc/update.sh && chmod +x update.sh && ./update.sh ;;
8|08) clear ; cat /etc/log-create-user.log ; read -p "Press [ Enter ] For Back To Menu" ;;
*) menu ;;
esac
