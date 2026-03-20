#!/bin/bash
# ===============================================
# Script: service_checker.sh
# Author: Komal
# Version:1.0
# Description: Checks status of critical services
# Usage: ./service_checker.sh
# ================================================

set -e 
set -u
 
SERVICES=("docker" "ssh" "cron" "nginx" "ufw")

for SERVICE in "${SERVICES[@]}"; do
	if systemctl is-active --quiet $SERVICE; then
		echo "OK: $SERVICE is RUNNING"
	else
		echo "WARNING: $SERVICE is STOPPED"
	fi
done
