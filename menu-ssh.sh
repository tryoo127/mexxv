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
echo -e "\E[44;1;39m                       SSH/OVPN MENU                          \E[0m"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
echo -e "\033[0;34m    * [1]\e[0m  : Create SSH & OpenVPN Account\e[0m"
echo -e "\033[0;34m    * [2]\e[0m  : Generate SSH & OpenVPN Trial Account\e[0m"
echo -e "\033[0;34m    * [3]\e[0m  : Extending SSH & OpenVPN Account Active Life\e[0m"
echo -e "\033[0;34m    * [4]\e[0m  : Delete SSH & OpenVPN Account\e[0m"
echo -e "\033[0;34m    * [5]\e[0m  : Check User Login SSH & OpenVPN\e[0m"
echo -e "\033[0;34m    * [6]\e[0m  : Daftar Member SSH & OpenVPN\e[0m"
echo -e "\033[0;34m    * [7]\e[0m  : Delete User Expired SSH & OpenVPN\e[0m"
echo -e "\033[0;34m    * [8]\e[0m  : Set up Autokill SSH\e[0m"
echo -e "\033[0;34m    * [9]\e[0m  : Displays Users Who Do Multi Login SSH\e[0m"
echo -e "\033[0;34m    * [10]\e[0m : Restart Dropbear,Squid,OpenVPN\e[0m"
echo -e ""
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -p "        Select From Options [1-10 or x]: " menussh
echo -e ""
case $menussh in
1)
usernew
;;
2)
trial
;;
3)
renew
;;
4)
deluser
;;
5)
cek
;;
6)
member
;;
7)
delete 
;;
8)
autokill
;;
9)
ceklim 
;;
10)
restart 
;;
x)
menu
;;
*)
menu
;;
esac
