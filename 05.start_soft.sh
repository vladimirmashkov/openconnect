#!/bin/bash
csf -r
sysctl -p
systemctl start ocserv
systemctl status ocserv