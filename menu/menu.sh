#!/bin/bash
MYIP=$(curl -sS ipv4.icanhazip.com)
url_izin="https://raw.githubusercontent.com/zhets/izinsc/main/ip"
username=$(curl -sS ${url_izin} | grep $MYIP | awk '{print $2}')
valid=$(curl -sS ${url_izin} | grep $MYIP | awk '{print $3}')
d1=$(date -d "$valid" +%s)
d2=$(date -d "$today" +%s)
certifacate=$(((d1 - d2) / 86400))
DATE=$(date +'%Y-%m-%d')
datediff() {
    d1=$(date -d "$1" +%s)
    d2=$(date -d "$2" +%s)
    echo -e "$COLOR1 $NC Expiry In   : $(( (d1 - d2) / 86400 )) Days"
}
mai="datediff "$Exp" "$DATE""
Info="(${green}Active${NC})"
Error="(${RED}Expired${NC})"
today=`date -d "0 days" +"%Y-%m-%d"`
Exp1=$(curl ${url_izin} | grep $MYIP | awk '{print $3}')
if [[ $today < $Exp1 ]]; then
sts="${Info}"
else
sts="${Error}"
fi



blue='\033[0;96m'
y='\033[0;93m'
NC='\033[0m'
ksk="               ${z}"
sama="${y}=$NC"

uptime=$(uptime -p | cut -d " " -f 2-10000)
ramvps=$(free -m | awk 'NR==2 {print $2}')

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

sshws=$(service ws-stunnel status | grep active | cut -d ' ' $stat)
if [ "$sshws" = "active" ]; then
status_ssh="${green}ON${NC}"
else
status_ssh="${red}OFF${NC}"
fi
ngx=$(service nginx status | grep active | cut -d ' ' $stat)
if [ "$ngx" = "active" ]; then
status_nginx="${green}ON${NC}"
else
status_nginx="${red}OFF${NC}"
fi
v2r=$(service xray status | grep active | cut -d ' ' $stat)
if [ "$v2r" = "active" ]; then
status_xray="${green}ON${NC}"
else
status_xray="${red}OFF${NC}"
fi
function lane_atas() {
echo -e " ${z}╭────────────────────────────────────────────────────╮${NC}"
}
function lane_bawah() {
echo -e " ${z}╰────────────────────────────────────────────────────╯${NC}"
}
ungu='\033[0;35m'
w='\033[1;96m'
clear
lane_atas
echo -e " ${blue}│ \e[1;92;41m                XDXL STORE TUNNELING              ${NC}${blue} │${NC}"
lane_bawah
lane_atas
echo -e " ${blue}│${NC} OS            ${NC}:  "`hostnamectl | grep "Operating System" | cut -d ' ' -f5-`
echo -e " ${blue}│${NC} IP            ${NC}:  $MYIP"
echo -e " ${blue}│${NC} TOTAL RAM     ${NC}:  $ramvps MB"
#echo -e " ${blue}│${NC} SWAP RAM      ${NC}:  $MEMOFREE MB"
echo -e " ${blue}│${NC} ISP           ${NC}:  $(cat /root/.isp)" 
echo -e " ${blue}│${NC} CITY          ${NC}:  $(cat /root/.city)"
echo -e " ${blue}│${NC} DOMAIN        ${NC}:  $(cat /etc/xray/domain)"
echo -e " ${blue}│${NC} UPTIME        ${NC}:  $uptime"
lane_bawah
lane_atas
echo -e " ${z}│${b} SSH-WS$NC : $status_ssh ${z}│$b NGINX$NC : $status_nginx ${z}│$b XRAY$NC : $status_xray ${z}│$b   DONE   ${z}│$NC" 
lane_bawah
echo -e "       ╭─────────────────────────────────────────╮" | lolcat
echo -e "                    ${g} TOTAL ACCOUNTS ${NC}"
echo -e ""
echo -e "${ksk}SSH/OVPN$NC    ${sama}$r $ssh1$NC $a"
echo -e "${ksk}VMESS$NC       ${sama}$r $vma$NC $a"
echo -e "${ksk}VLESS$NC       ${sama}$r $vla$NC $a"
echo -e "${ksk}TROJAN$NC      ${sama}$r $tra$NC $a"
echo -e "${ksk}TROJAN GO$NC   ${sama}$r $trgo$NC $a"
echo -e "       ╰─────────────────────────────────────────╯" | lolcat
echo -e "         ${blue}┌─────────────────────────────────────┐${NC}"
echo -e "         ${blue}│$NC Version    : V1.2${NC}"
echo -e "         ${blue}│$NC Clent Name : $username ${NC}"
echo -e "         ${blue}│$NC Exp Script : $valid ${w}($r $certifacate${NC} ) Days${NC}"
echo -e "         ${blue}└─────────────────────────────────────┘${NC}"
lane_atas
echo -e " ${blue}│       ${ungu}[${w}01${ungu}]${NC} SSH WS       ${ungu}[${w}05${ungu}]${NC} FEATURES              ${blue}│${NC}"
echo -e " ${blue}│       ${ungu}[${w}02${ungu}]${NC} XRAY         ${ungu}[${w}06${ungu}]${NC} STATUS SERVICE        ${blue}│${NC}"
echo -e " ${blue}│       ${ungu}[${w}03${ungu}]${NC} TROJAN       ${ungu}[${w}07${ungu}]${NC} UPDATE SCRIPT         ${blue}│${NC}"
echo -e " ${blue}│       ${ungu}[${w}04${ungu}]${NC} MENU BACKUP  ${ungu}[${w}08${ungu}]${NC} LOG CREATE            ${blue}│${NC}"
lane_bawah
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
