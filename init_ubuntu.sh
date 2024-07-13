#!/usr/bin/env bash
set -euxo pipefail

apt-get update
apt-get upgrade -y


apt-get install -y build-essential zip unzip
apt-get install -y language-pack-ja

update-locale LANG=ja_JP.UTF8
localectl set-locale LANG=ja_JP.UTF-8

apt-get install -y manpages-ja manpages-ja-dev
