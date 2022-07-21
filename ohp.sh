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

# Ohp Script
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================

# Download File Ohp
wget https://github.com/lfasmpao/open-http-puncher/releases/download/0.1/ohpserver-linux32.zip
unzip ohpserver-linux32.zip
chmod +x ohpserver
cp ohpserver /usr/local/bin/ohpserver
/bin/rm -rf ohpserver*

# Installing Service
# SSH OHP Port 8181
cat > /etc/systemd/system/ssh-ohp.service << END
[Unit]
Description=SSH OHP Redirection Service
Documentation=https://t.me/XoolVPN
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/local/bin/ohpserver -port 8181 -proxy 127.0.0.1:3128 -tunnel 127.0.0.1:22
Restart=on-failure
LimitNOFILE=infinity

[Install]
WantedBy=multi-user.target
END

# Dropbear OHP 8282
cat > /etc/systemd/system/dropbear-ohp.service << END
[Unit]]
Description=Dropbear OHP Redirection Service
Documentation=https://t.me/XoolVPN
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/local/bin/ohpserver -port 8282 -proxy 127.0.0.1:3128 -tunnel 127.0.0.1:109
Restart=on-failure
LimitNOFILE=infinity

[Install]
WantedBy=multi-user.target
END

# OpenVPN OHP 8888
cat > /etc/systemd/system/openvpn-ohp.service << END
[Unit]]
Description=OpenVPN OHP Redirection Service
Documentation=https://t.me/XoolVPN
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/local/bin/ohpserver -port 8888 -proxy 127.0.0.1:3128 -tunnel 127.0.0.1:1194
Restart=on-failure
LimitNOFILE=infinity

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable ssh-ohp
systemctl restart ssh-ohp
systemctl enable dropbear-ohp
systemctl restart dropbear-ohp
systemctl enable openvpn-ohp
systemctl restart openvpn-ohp
#------------------------------
printf 'INSTALLATION COMPLETED !\n'
sleep 0.5
printf 'CHECKING LISTENING PORT\n'
if [ -n "$(ss -tupln | grep ohpserver | grep -w 8181)" ]
then
	echo 'SSH OHP Redirection Running'
else
	echo 'SSH OHP Redirection Not Found, please check manually'
fi
sleep 0.5
if [ -n "$(ss -tupln | grep ohpserver | grep -w 8282)" ]
then
	echo 'Dropbear OHP Redirection Running'
else
	echo 'Dropbear OHP Redirection Not Found, please check manually'
fi
sleep 0.5
if [ -n "$(ss -tupln | grep ohpserver | grep -w 8888)" ]
then
	echo 'OpenVPN OHP Redirection Running'
else
	echo 'OpenVPN OHP Redirection Not Found, please check manually'
fi
sleep 0.5
