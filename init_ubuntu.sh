#!/usr/bin/env bash
set -euxo pipefail

sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install language-pack-ja -y
sudo update-locale LANG=ja_JP.UTF8
sudo timedatectl set-timezone Asia/Tokyo
