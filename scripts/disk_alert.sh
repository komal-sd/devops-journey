#!/bin/bash
 # ===============================================================
 #  Script: disk_alert.sh
 #  Author: Komal
 #  Version: 1.0
 # Description: Monitors disk usage
 #  ===============================================================
 set -e
 set -u
 
#Configuration
 THRESHOLD=80
 PARTITION="/"

 check_disk(){
  USED=$(df -h $1 | awk 'NR==2{printf "%.0f", $5}'| tr -d '%')
  if [ $USED -gt $THRESHOLD ]; then
	  echo "WARNING: $1 is Critical: ${USED}%"
  else
	  echo "OK: $1 is Healthy: ${USED}%"
  fi

 }
 check_disk $PARTITION
 check_disk /boot/efi

echo ""
# =================================================================

# =================================================================
