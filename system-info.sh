#!/bin/bash

MYIP=$(wget -qO- ipinfo.io/ip);
IZIN=$( curl -sS https://raw.githubusercontent.com/tryoo127/access/main/ip | awk '{print $4}' | grep $MYIP )
if [ $MYIP = $IZIN ]; then
clear
echo -e "${green}   TAHNIAH! ANDA DIBENARKAN MENGGUNAKAN SCRIPT INI...${NC}"
else
clear
echo ""
rm -f setup.sh
echo '                            ...                           '
echo -e "${red}        MAAF! ANDA TIDAK DIBENARKAN MENGGUNAKAN SCRIPT INI...${NC}"
echo '                            ...                           ' 
sleep 7
exit 0
fi
clear

echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[44;1;39m                      SYSTEM INFO MENU                        \E[0m"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
echo -e "\033[0;34m    * [1]\e[0m:  CHANGE PORT\e[0m"
echo -e "\033[0;34m    * [2]\e[0m:  RENEW CERTIFICATE\e[0m"
echo -e "\033[0;34m    * [3]\e[0m:  ADD OR CHANGE DOMAIN\e[0m"
echo -e "\033[0;34m    * [4]\e[0m:  BACKUP DATA\e[0m"
echo -e "\033[0;34m    * [5]\e[0m:  AUTO BACKUP\e[0m"
echo -e "\033[0;34m    * [6]\e[0m:  RESTORE BACKUP\e[0m"
echo -e "\033[0;34m    * [7]\e[0m:  WEBMIN MENU\e[0m"
echo -e "\033[0;34m    * [8]\e[0m:  SERVER INFORMATION\e[0m"
echo -e "\033[0;34m    * [9]\e[0m:  CHECK SERVER BANDWIDTH\e[0m"
echo -e "\033[0;34m    * [10]\e[0m: REBOOT VPS SERVER\e[0m"
echo -e ""
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -p "        Select From Options [1-10 or x]: " menussh
echo -e ""
case $menussh in
1)
change-port
;;
2)
certv2ray
;;
3)
add-host
;;
4)
backup
;;
5)
autobackup
;;
6)
restore
;;
7)
wbmn 
;;
8)
info
;;
9)
vnstat -d
;;
10)
reboot
;;
x)
menu
;;
*)
menu
;;
esac
