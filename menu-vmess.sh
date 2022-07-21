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
echo -e "\E[44;1;39m                      V2RAY VLESS MENU                        \E[0m"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
echo -e "\033[0;34m    * [1]\e[0m: Create V2RAY Vmess Websocket Account\e[0m"
echo -e "\033[0;34m    * [2]\e[0m: Deleting V2RAY Vmess Websocket Account\e[0m"
echo -e "\033[0;34m    * [3]\e[0m: Extending Vmess Account Active Life\e[0m"
echo -e "\033[0;34m    * [4]\e[0m: Check User Login V2RAY\e[0m"
echo -e ""
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -p "        Select From Options [1-5 or x]: " menuvmess
echo -e ""
case $menuvmess in
1)
add-ws
;;
2)
del-ws
;;
3)
renew-ws
;;
4)
cek-ws
;;
x)
menu
;;
*)
menu
;;
esac
