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

echo " "
echo "===========================================";
echo " ";
if [ -e "/root/log-limit.txt" ]; then
echo "User Who Violate The Maximum Limit";
echo "Time - Username - Number of Multilogin"
echo "-------------------------------------";
cat /root/log-limit.txt
else
echo " No user has committed a violation"
echo " "
echo " or"
echo " "
echo " The user-limit script not been executed."
fi
echo " ";
echo "===========================================";
echo " ";