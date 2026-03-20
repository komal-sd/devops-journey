#!/bin/bash
# ===================================================
# Script: System_checker
# Author: Komal
# Version: 1.0
# Description: Checks the Disk usage ,Services are Running,Memory usages
# Usage: ./system_checker.sh

set -e
set -u
LOG_FILE=~/devops-journey/logs/system_report.log

log(){
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a $LOG_FILE
}
log "================================"
log "DISK USAGE"
log "================================"

 PARTITIONS=("/" "/boot/efi")
 for PARTITION in "${PARTITIONS[@]}"; do
    INFO=$(df -h $PARTITION | awk 'NR==2{print $3"/"$2, $5}')
    log "DISK $PARTITION → $INFO"
done
log "================================"
log "SERVICES STATUS"
log "================================"
SERVICES=("docker" "ssh" "cron" "nginx" "ufw")
for SERVICE in "${SERVICES[@]}"; do
    if systemctl is-active --quiet $SERVICE; then
        log "OK: $SERVICE is RUNNING"
    else
        log "WARNING: $SERVICE is STOPPED"
    fi
done

log "================================"
log "MEMORY USAGE"
log "================================"

MEMORY=$(free -h | awk 'NR==2{print "Total:", $2, "| Used:", $3, "| Free:", $4}')
log "$MEMORY"
