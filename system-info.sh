#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
cyan='\e[0;36m'
NC='\e[0m'
MYIP=$(wget -qO- ipinfo.io/ip);
IZIN=$( curl -sS https://raw.githubusercontent.com/tryoo127/access/main/ip | awk '{print $4}' | grep $MYIP )
if [ $MYIP = $IZIN ]; then
clear
echo -e "${green}            PERMISSION ACCEPTED!${NC}"
else
clear
echo ""
rm -f setup.sh
echo -e "${red}              PERMISSION DENIED!${NC}"
echo -e "${green} PLEASE CONTACT @XoolVPN TO REGISTER YOUR I.P${NC}"
sleep 7
exit 0
fi
clear

echo -e "\033[0;37m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[0;37;46m           ◎ SYSTEM INFO MENU ◎                    \e[0m"
echo -e
echo -e " [1]\e[0m•\e[1;36mCHANGE PORT\e[0m"
echo -e " [2]\e[0m•\e[1;36mRENEW CERTIFICATE\e[0m"
echo -e " [3]\e[0m•\e[1;36mADD OR CHANGE DOMAIN\e[0m"
echo -e " [4]\e[0m•\e[1;36mBACKUP DATA\e[0m"
echo -e " [5]\e[0m•\e[1;36mAUTO BACKUP\e[0m"
echo -e " [6]\e[0m•\e[1;36mRESTORE BACKUP\e[0m"
echo -e " [7]\e[0m•\e[1;36mWEBMIN MENU\e[0m"
echo -e " [8]\e[0m•\e[1;36mSERVER INFORMATION\e[0m"
echo -e " [9]\e[0m•\e[1;36mCHECK SERVER BANDWIDTH\e[0m"
echo -e " [10]\e[0m•\e[1;36mREBOOT VPS SERVER\e[0m"
echo -e
echo -e "\E[0;37;46m           ◎ Moded By 𝑿𝒐𝒐𝒍𝚅𝙿𝙽 ◎                    \e[0m"
echo -e "\033[0;37m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
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
