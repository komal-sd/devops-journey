#!/bin/bash
# =====================================================

# Script: cpu_check.sh
# Author: Komal
# Description: Check CPU Performance
# =====================================================
THRESHOLD=80

  cpu_checks(){
   USED=$(top -bn1 | grep "Cpu(s)" | awk '{printf "%.0f", $2}')
   if [ $USED -gt $THRESHOLD ]; then
	   echo "WARNING: CPU Critical : ${USED}%"
   else
	   echo "OK: CPU Healthy: ${USED}%"
   fi

  }
  cpu_checks
