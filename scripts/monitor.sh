#!/bin/bash

echo "=============================================================="
echo " SYSTEM MONITOR "
echo "=============================================================="

set -e
set -u
# Function for check memory
check_memory(){
	USED=$(free | awk 'NR==2{printf "%.0f",$3/$2*100}')
	echo "RAM Usage: $USED%"

	if [ $USED -gt 80 ]; then
		echo "🔴 WARNING: RAM Critical!"
	elif [ $USED -gt 60 ]; then
		echo "🟡 NOTICE: RAM High"
	else
		echo "🟢 RAM Healthy"
	fi
 
}
echo "--- Memory Check ---"
check_memory

#Function -2 CPU Checks
check_cpu(){
	USED=$(top -bn1 | grep "Cpu(s)" | awk '{printf "%.0f", $2}')
        echo "CPU Usage: $USED%"

	if [ $USED -gt 80 ]; then
		echo "🔴 WARNING: CPU Critical!"
	elif [ $USED -gt 60 ]; then
		echo "🟡 NOTICE: CPU High"
	else
		echo "🟢 CPU Healthy"
	fi
}


echo ""
echo "--- CPU Check ---"
check_cpu

echo ""
echo "======================================================="
echo " REPORT of $(date +%Y-%m-%d)"
echo "======================================================="
