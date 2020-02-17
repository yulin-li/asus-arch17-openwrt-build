#!/bin/sh
set -e

git clone https://github.com/coolsnowwolf/lede.git
cd lede/feeds/luci/applications/
git clone https://github.com/tty228/luci-app-serverchan.git
cd ../../..
./scripts/feeds install -a
./scripts/feeds update -a

cp -rf $(Build.Repository.LocalPath)/ci/.config .

echo "CPU Cores: "`grep -c ^processor /proc/cpuinfo`

make -j`grep -c ^processor /proc/cpuinfo` V=99

cp -r bin $(Build.ArtifactStagingDirectory)/
