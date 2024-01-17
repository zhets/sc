clear
grenbo="\e[92;1m"
NC='\e[0m' # penutup
clear
echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
echo -e "\033[1;93m│$NC\033[42m          BCKP MANAGER RE                 $NC"
echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
echo -e "\033[1;93m│  ${grenbo}1.${NC} \033[0;36mBackup Vps Data${NC}"
echo -e "\033[1;93m│  ${grenbo}2.${NC} \033[0;36mRestored Vps Data${NC}"
echo -e "\033[1;93m│  ${grenbo}0.${NC} \033[0;36mComeback${NC}"
echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
echo
echo -e "${BlueCyan}"
read -p    "Pilih Nomor └╼>>> " bro

if [ $bro = 1 ] || [ $bro = 1 ]
then
figlet "backup" | lolcat
backup
echo "--------------------------------------------------------"
echo
echo "Terimakasih Sudah Mamakai Script Goblok Ini"
echo
echo "--------------------------------------------------------"
fi

if [ $bro = 2 ] || [ $bro = 2 ]
then
figlet "Restore" | lolcat
restore
echo "--------------------------------------------------------"
echo
echo "Terimakasih Sudah Mamakai Script Goblok Ini"
echo
echo "--------------------------------------------------------"
fi
if [ $bro = 0 ] || [ $bro = 0 ]
then
figlet "ok"
menu
echo "--------------------------------------------------------"
echo
echo "Terimakasih Sudah Mamakai Script Goblok Ini"
echo
echo "--------------------------------------------------------"
fi
if [ $bro = 4 ] || [ $bro = 4 ]
then
limitspeed
echo "--------------------------------------------------------"
echo
echo "Terimakasih Sudah Mamakai Script Goblok Ini"
echo
echo "--------------------------------------------------------"
fi

if [ $bro = 5 ] || [ $bro = 5 ]
then
autobackup
echo "--------------------------------------------------------"
echo
echo "Terimakasih Sudah Mamakai Script Goblok Ini"
echo
echo "--------------------------------------------------------"
fi
