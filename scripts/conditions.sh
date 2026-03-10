#!/bin/bash

DISK=$(df -h / | awk 'NR==2{print $5}' | tr -d '%')
echo "Current disk usage: $DISK%"

if [ $DISK -gt 80 ]; then
    echo "WARNING: Disk is critically full!"
elif [ $DISK -gt 60 ]; then
    echo "NOTICE: Disk getting full"
else
    echo "Disk is healthy"
fi

if systemctl is-active --quiet docker; then
    echo "Docker is running"
else
    echo "Docker stopped — starting..."
    sudo systemctl start docker
fi

RAM=$(free | awk 'NR==2{printf "%.0f", $3/$2*100}')
echo "RAM usage: $RAM%"

if [ $RAM -gt 80 ]; then
    echo "WARNING: RAM critically high!"
elif [ $RAM -gt 60 ]; then
    echo "NOTICE: RAM usage is high"
else
    echo "RAM is healthy"
fi
