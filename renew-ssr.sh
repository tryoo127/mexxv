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
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/usr/local/shadowsocksr/akun.conf")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	clear
	echo ""
	echo "Select the existing client you want to renew"
	echo " Press CTRL+C to return"
	echo -e "==============================="
	grep -E "^### " "/usr/local/shadowsocksr/akun.conf" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
read -p "Expired (days): " masaaktif
user=$(grep -E "^### " "/usr/local/shadowsocksr/akun.conf" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/usr/local/shadowsocksr/akun.conf" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
exp3=$(($exp2 + $masaaktif))
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
tgl=$(echo "$exp4" | cut -d- -f3)
bln=$(echo "$exp4" | cut -d- -f2)
sed -i "s/### $user $exp/### $user $exp4/g" /usr/local/shadowsocksr/akun.conf
clear
echo ""
echo " Shadowsocks-R Account Has Been Successfully Renewed"
echo " =========================="
echo " Client Name : $user"
echo " Expired On  : $exp4"
echo " =========================="