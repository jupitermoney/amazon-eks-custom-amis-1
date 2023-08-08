#!/usr/bin/env bash

set -o pipefail
set -o nounset
set -o errexit

# upgrade the operating system
yum update -y && yum autoremove -y
yum install -y parted system-lsb-core

# Disable IPv6
sysctl -w net.ipv6.conf.all.disable_ipv6=1
sysctl -w net.ipv6.conf.default.disable_ipv6=1
sysctl -w net.ipv6.route.flush=

# enable the epel release
amazon-linux-extras install epel -y

echo "rebooting the instance"
reboot
