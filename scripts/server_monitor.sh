#!/bin/bash
# ===============================================
# Scripts: server_monitor.sh
# Author: Komal
# version: 1.0
# Description: Complete server monitoring dashboard
# Usage: ./server_monitor.sh
# ===============================================
set -e
set -u
#Configuration
LOG_FILE=~/devops-journey/logs/server_monitor.log
THRESHOLD=80
WARNINGS=0

 # Logging function
 log(){
	 echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a $LOG_FILE
 }

 #Disk Check function
 check_disk(){
	 USAGE=$(df $1 |awk 'NR==2{print $5}'| tr -d '%')
	 if [ $USAGE -gt $THRESHOLD ]; then
		 log "WARNING :$1 disk at ${USAGE}%"
		 WARNINGS=$((WARNINGS + 1))
	 else
		 log "OK: $1 disk at ${USAGE}%"
	 fi
 }

 # Memory function
 check_memory(){
	 USAGE=$(free | awk 'NR==2{printf "%.0f", $3/$2*100}')
	 if [ $USAGE -gt $THRESHOLD ]; then
		 log "WARNING : memory is ${USAGE}%"
		 WARNINGS=$((WARNINGS + 1))
	 else
		 log "OK: memory is ${USAGE}%"
	 fi
 }

 #CPU check function
 check_cpu(){
	 USAGE=$(top -bn1| grep "Cpu(s)"|awk '{printf "%.0f", $2}')
	 if [ $USAGE -gt $THRESHOLD ];then
		 log "WARNING: CPU at ${USAGE}%"
		 WARNINGS=$((WARNINGS + 1))
	 else
		 log "OK : CPU is ${USAGE}%"
	 fi
 }

 # Service check funcion
 check_services(){
	 SERVICES=("docker" "cron" "ssh" "ufw")
	 for SERVICE in "${SERVICES[@]}"; do
		 if systemctl is-active --quiet $SERVICE; then
			 log "OK : $SERVICE is RUNNING"
		 else
			 log "WARNING: $SERVICE STOPPED - attempting restart..."
			 if systemctl restart $SERVICE 2>/dev/null;then
				 log "SUCCESS: $SERVICE restarted!"
			 else
				 log "CRITICAL: $SERVICE failed to restart!"
				 WARNINGS=$((WARNINGS + 1))
			 fi
		 fi
	 done
 }

 # Main function for monitor
 main(){
	 log "================================"
	 log "SERVER MONITOR STARTING"
	 log "================================"

	 check_disk "/"
	 check_disk "/boot/efi"
	 check_memory
	 check_cpu
	 check_services

	 log "================================"
	 log "TOTAL WARNINGS: $WARNINGS"
	 log "================================"
 }

 main
