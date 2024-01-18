#!/bin/bash
MYIP=$(curl -sS ipv4.icanhazip.com)
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
echo -e " ${BICyan}│ ${BIB}             XDXL STORE TUNNELING             ${NC}${BICyan} │${NC}"
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
echo -e "        ${BICyan}┌─────────────────────────────────────┐${NC}"
echo -e "        ${BICyan}│$NC Version    : V1.01${NC}"
echo -e "        ${BICyan}│$NC Clent Name : $username ${NC}"
echo -e "        ${BICyan}│$NC Exp Script : $valid ${w}($r $certifacate${NC} ) Days${NC}"
echo -e "        ${BICyan}└─────────────────────────────────────┘${NC}"
echo -e " ${BICyan}┌────────────────────────────────────────────────┐${NC}"
echo -e " ${BICyan}│${NC} ${w}1.${NC}  >> SSH WS      ${w}4.${NC} >> Backup/Restore"
echo -e " ${BICyan}│${NC} ${w}2.${NC}  >> XRAY        ${w}5.${NC} >> Features"
echo -e " ${BICyan}│${NC} ${w}3.${NC}  >> TROJAN      ${w}6.${NC} >> Status Service"
echo -e " ${BICyan}│${NC} ${w}8.${NC}  >> LOG CREATE  ${w}7.${NC} >> Update Script"
echo -e " ${BICyan}└────────────────────────────────────────────────┘${NC}"
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
