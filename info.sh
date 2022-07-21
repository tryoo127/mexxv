#!/bin/bash
clear
green='\e[0;32m'
red='\e[31m'
NC='\e[0m'
MYIP=$(wget -qO- ipinfo.io/ip);
IZIN=$( curl -sS https://raw.githubusercontent.com/tryoo127/access/main/ip | awk '{print $4}' | grep $MYIP )
if [ $MYIP = $IZIN ]; then
clear
echo -e "${green}TAHNIAH! ANDA DIBENARKAN MENGGUNAKAN SCRIPT @mexxv! ${NC}"
sleep 5
else
clear
echo ""
rm -f setup.sh
echo '                            ...                           '
echo -e "${red}MAAF! ANDA TIDAK DIBENARKAN MENGGUNAKAN SCRIPT INI! ${NC}"
echo '                            ...                           ' 
sleep 20
exit 0
fi
clear
echo '============================================='
echo ''
cat /root/log-install.txt
echo ""
