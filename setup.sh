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

echo '============================================='
echo '      UPDATE & UPGRADE IN PROGRESS '
echo '============================================='
apt update && apt upgrade -y
clear
echo '============================================='
echo '      UPDATE & UPGRADE PROCESS COMPLETE '
echo '============================================='
clear
echo '============================================='
echo '       NEXT PROCESS PLEASE WAIT  '
echo '============================================='
mkdir /etc/v2ray
mkdir /var/lib/premium-script;
mkdir /var/lib/crot-script;
clear
echo '============================================='
echo "       ENTER YOUR DOMAIN OR SUBDOMAIN"
echo '============================================='
read -p "Hostname / Domain: " host
echo "IP=$host" >> /var/lib/premium-script/ipvps.conf
echo "IP=$host" >> /var/lib/crot-script/ipvps.conf
echo "$host" >> /etc/v2ray/domain
clear
echo '============================================='
echo '       INSTALLING SSH & OPENVPN '
echo '============================================='
wget https://raw.githubusercontent.com/tryoo127/mexxv/main/ssh-vpn.sh && chmod +x ssh-vpn.sh && screen -S ssh-vpn ./ssh-vpn.sh
echo '============================================='
echo '       INSTALLING SHADOWSOCKSR '
echo '============================================='
wget https://raw.githubusercontent.com/tryoo127/mexxv/main/ssr.sh && chmod +x ssr.sh && screen -S ssr ./ssr.sh
echo '============================================='
echo '       INSTALLING SHADOWSOCKSOBFS '
echo '============================================='
wget https://raw.githubusercontent.com/tryoo127/mexxv/main/sodosok.sh && chmod +x sodosok.sh && screen -S ss ./sodosok.sh
echo '============================================='
echo '       INSTALLING WIREGUARD '
echo '============================================='
wget https://raw.githubusercontent.com/tryoo127/mexxv/main/wg.sh && chmod +x wg.sh && screen -S wg ./wg.sh
echo '============================================='
echo '       INSTALLING V2RAY '
echo '============================================='
wget https://raw.githubusercontent.com/tryoo127/mexxv/main/ins-vt.sh && chmod +x ins-vt.sh && screen -S v2ray ./ins-vt.sh
echo '============================================='
echo '       INSTALLING XRAY '
echo '============================================='
wget https://raw.githubusercontent.com/tryoo127/mexxv/main/install-xray.sh && chmod +x install-xray.sh && screen -S v2ray ./install-xray.sh
echo '============================================='
echo '       INSTALLING OPENVPN OHP '
echo '============================================='
wget https://raw.githubusercontent.com/tryoo127/mexxv/main/ohp.sh && chmod +x ohp.sh && ./ohp.sh
wget https://raw.githubusercontent.com/tryoo127/mexxv/main/set-br.sh && chmod +x set-br.sh && ./set-br.sh

rm -f /root/ssh-vpn.sh
rm -f /root/wg.sh
rm -f /root/ss.sh
rm -f /root/ssr.sh
rm -f /root/ins-vt.sh
rm -f /root/install-xray.sh
rm -f /root/set-br.sh
rm -f /root/ohp.sh
echo "1.1" > /home/ver

echo "menu" >> .profile
clear
echo ""
echo '============================================='
echo "      INSTALLATION HAS BEEN COMPLETED!!"
echo '============================================='
sleep 2
echo ""
echo "      Lite Autoscript By @mexxv" | tee -a log-install.txt
echo "=============================================" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                 : 22"  | tee -a log-install.txt
echo "   - OpenVPN                 : TCP 1194, UDP 2200, SSL 442"  | tee -a log-install.txt
echo "   - SSL/TLS                 : 789, 777"  | tee -a log-install.txt
echo "   - Dropbear                : 109, 143"  | tee -a log-install.txt
echo "   - OpenVPN OHP             : 8888"  | tee -a log-install.txt
echo "   - Squid Proxy             : 3128, 8080 ,8000 (limit to IP Server)"  | tee -a log-install.txt
echo "   - Wireguard               : 7070"  | tee -a log-install.txt
echo "   - Shadowsocks-R           : 1443-1543"  | tee -a log-install.txt
echo "   - SS-OBFS TLS             : 2443-2543"  | tee -a log-install.txt
echo "   - SS-OBFS HTTP            : 3443-3543"  | tee -a log-install.txt
echo "   - V2RAY Vmess TLS         : 8443"  | tee -a log-install.txt
echo "   - V2RAY Vmess None TLS    : 8444"  | tee -a log-install.txt
echo "   - V2RAY Vless TLS         : 2083"  | tee -a log-install.txt
echo "   - V2RAY Vless None TLS    : 80"  | tee -a log-install.txt
echo "   - XRAY VLESS XTLS         : 443"  | tee -a log-install.txt
echo "   - Trojan                  : 2087"  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Malaysia (UTC +8)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON/SET]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On 05.00 UTC +8" | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo ""
echo "=============================================" | tee -a log-install.txt
echo "      Lite Autoscript By @mexxv" | tee -a log-install.txt
echo ""
sleep 2
echo '============================================='
echo '      SYSTEM WILL BE REBOOT AUTOMATICALLY'
echo '============================================='
echo ""
rm -f /root/setup.sh
rm -f /root/.bash_history
echo " Reboot 10 Sec, Setelah LOGIN, type menu"
sleep 10
reboot
