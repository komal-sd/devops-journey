#!/bin/bash

echo "=============================================="
echo "  FUNCTIONS PRATICE  "
echo "=============================================="

# Function -1 Basic Function
greet_student(){
   echo "Hello $1! Welcome to DevOps!"
   echo "Your goal is $2"
}

#Calling the function
greet_student "Komal" "6LPA Job"
greet_student "Student" "AWS Certification"

echo ""

# Function 2 -Check service
 check_service(){
  if systemctl is-active --quiet $1; then
	  echo "✅ $1 is RUNNING"
  else
	  echo "❌ $1 is STOPPED"
  fi
 }

 echo "--- Service Status ---"
 check_service docker
 check_service ssh
 check_service cron

 echo ""

 # Function 3 -Check disk with threshold
 check_disk(){
   USAGE=$(df -h $1 | awk 'NR==2{print $5}' | tr -d '%')
   if [ $USAGE -gt 80 ]; then
	   echo "🔴 $1 is CRITICAL: ${USAGE}% used"
   elif [ $USAGE -gt 60 ]; then
	   echo "🟡 $1 is WARNING: ${USAGE}% used"
   else
	   echo "🟢 $1 is HEALTHY: ${USAGE}% used"
   fi
 }

 echo "--- Disk Status ---"
 check_disk /
 check_disk /boot/efi

 echo ""
 echo ""
 echo "=========================================="
 echo "  FUNCTIONS COMPLETE  "
 echo "=========================================="
