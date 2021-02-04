#!/bin/bash
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -s 192.168.1.0/24 -j ACCEPT
iptables -A FORWARD -j REJECT
iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -o eno16777736 -j MASQUERADE
iptables -t nat -A POSTROUTING -j SNAT --to-source <global_ip>
echo "1" > /proc/sys/net/ipv4/ip_forward