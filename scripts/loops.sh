#!/bin/bash

echo "================================"
echo "LESSON 4 — Loops Practice"
echo "================================"

# FOR LOOP 1 — Simple list
echo ""
echo "--- Checking Services ---"
for service in docker ssh cron nginx; do
    if systemctl is-active --quiet $service; then
        echo "$service is RUNNING"
    else
        echo "$service is STOPPED"
    fi
done

# FOR LOOP 2 — Numbers
echo ""
echo "--- Countdown ---"
for number in 5 4 3 2 1; do
    echo "T minus $number"
done
echo "LAUNCH! 🚀"

# FOR LOOP 3 — Range
echo ""
echo "--- 30 Day Challenge ---"
for day in {1..30}; do
    echo "Day $day of DevOps journey"
done

# WHILE LOOP
echo ""
echo "--- While Loop ---"
COUNT=1
while [ $COUNT -le 5 ]; do
    echo "Count: $COUNT"
    COUNT=$((COUNT + 1))
done
echo "Done counting!"
