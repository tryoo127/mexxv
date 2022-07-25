```
apt install -y bzip2 gzip coreutils screen curl && wget https://raw.githubusercontent.com/tryoo127/mexxv/main/setup.sh && chmod +x setup.sh && sed -i -e 's/\r$//' setup.sh && screen -S setup ./setup.sh
```

### UPDATE WIREGUARD KERNEL
```
apt install linux-headers-$(uname -r) wireguard-dkms wireguard-tools
```
