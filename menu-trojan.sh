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
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[44;1;39m                        TROJAN MENU                           \E[0m"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
echo -e "\033[0;34m    * [1]\e[0m: Create Trojan Account\e[0m"
echo -e "\033[0;34m    * [2]\e[0m: Deleting Trojan Account\e[0m"
echo -e "\033[0;34m    * [3]\e[0m: Extending Trojan Account Active Life\e[0m"
echo -e "\033[0;34m    * [4]\e[0m: Check User Login Trojan\e[0m"
echo -e ""
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -p "        Select From Options [1-4 or x]: " menutrojan
echo -e ""
case $menutrojan in
1)
add-tr
;;
2)
del-tr
;;
3)
renew-tr
;;
4)
cek-tr
;;
x)
menu
;;
*)
menu
;;
esac
