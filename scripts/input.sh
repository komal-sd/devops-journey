#!/bin/bash

echo "================================"
echo "  DevOps Student Registration  "
echo "================================"

# Ask user for input
read -p "Enter your name: " NAME
read -p "Enter your salary: " SALARY
read -p "Enter days you can study per week: " DAYS

#Calculate
WEEKS=12
TOTAL_DAYS=$((DAYS * WEEKS))

echo ""
echo "================================"
echo "Your DevOps plan"
echo "Student: $NAME"
echo "Target: $SALARY LPA"
echo "Study days per week: $DAYS"
echo "Total study days in 3 months: $TOTAL_DAYS days"
echo "============================================="
echo "You got this $NAME! Keep going! 💪"
