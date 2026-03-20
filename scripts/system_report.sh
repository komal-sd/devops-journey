#!/bin/bash
# ===================================================
# Script: System_checker
# Author: Komal
# Version: 1.0
# Description: Checks the Disk usage ,Services are Running,Memory usages
# Usage: ./system_checker.sh

set -e
set -u

echo "================================"
echo "DISK USAGE"
echo "================================"

 PARTITIONS=("/" "/boot/efi")
 for PARTITION in "${PARTITIONS[@]}"; do
    INFO=$(df -h $PARTITION | awk 'NR==2{print $3"/"$2, $5}')
    echo "DISK $PARTITION → $INFO"
done
echo "================================"
echo "SERVICES STATUS"
echo "================================"
SERVICES=("docker" "ssh" "cron" "nginx" "ufw")
for SERVICE in "${SERVICES[@]}"; do
    if systemctl is-active --quiet $SERVICE; then
        echo "OK: $SERVICE is RUNNING"
    else
        echo "WARNING: $SERVICE is STOPPED"
    fi
done

echo "================================"
echo "MEMORY USAGE"
echo "================================"

free -h | awk 'NR==2{print "Total:", $2, "| Used:", $3, "| Free:", $4}'
