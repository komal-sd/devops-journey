#!/bin/bash

echo "========================================="
echo "  SYSTEM HEALTH REPORT - $(date)"
echo "========================================="

echo ""
echo "--- CPU USAGE ---"
top -bn1 | grep "Cpu(s)" | awk '{print "CPU Usage: " $2 "%"}'

echo ""
echo "--- MEMORY USAGE ---"
free -h | awk 'NR==2{printf "Used: %s / Total: %s\n", $3, $2}'

echo ""
echo "--- DISK USAGE ---"
df -h | grep "^/dev" | awk '{print $1 " Used: " $3 "/" $2 " (" $5 ")"}'

echo ""
echo "--- KEY SERVICES ---"
for service in docker ssh cron nginx; do
    if systemctl is-active --quiet $service; then
        echo "$service is RUNNING"
    else
        echo "$service is STOPPED"
    fi
done

echo ""
echo "========================================="
echo "         REPORT COMPLETE"
echo "========================================="
