#!/bin/bash
NAME="$1"

if [[ ! -n $NAME ]]; then
        echo Please provide container name
        exit 1
fi

lxc-create -n $NAME --template download -- --dist ubuntu --release resolute --arch amd64

# Below is for the case where are not using the lxc-default-with-nesting
# apparmor profile. In this case, systemd-networkd does not run.
#
# lxc-unpriv-start -n $NAME
# lxc-wait -n $NAME -s RUNNING
# lxc-unpriv-attach -n $NAME -- bash -s <<'SETUP'
# tee /etc/systemd/system/dhcpcd-eth0.service <<EOF
# [Unit]
# Description=DHCP client on eth0
# Before=network.target
# Wants=network.target
#
# [Service]
# ExecStart=$(command -v dhcpcd) -B eth0
# Restart=on-failure
#
# [Install]
# WantedBy=multi-user.target
# EOF
# echo 'nohook resolv.conf' | tee -a /etc/dhcpcd.conf
# systemctl disable systemd-networkd systemd-resolved
# systemctl enable dhcpcd-eth0
#
# rm /etc/resolv.conf
# echo 'nameserver 10.0.3.1' | tee /etc/resolv.conf
# SETUP
# lxc-stop -n $NAME
