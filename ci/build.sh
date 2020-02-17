#!/bin/sh
set -e

rm -rf lede
git clone https://github.com/coolsnowwolf/lede.git
cd lede
./scripts/feeds update -a
./scripts/feeds install -a

cd feeds/luci/applications/
git clone https://github.com/tty228/luci-app-serverchan.git
cd ../../..
./scripts/feeds update -a
./scripts/feeds install -a

cp -rf ../ci/.config .

echo "CPU Cores: "$(nproc)

make -j$(nproc)
