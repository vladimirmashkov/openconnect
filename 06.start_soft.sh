#!/bin/bash
csf -r
sysctl -p


systemctl stop docker
systemctl start docker
systemctl status docker