#!/bin/bash

echo "==========================================="
echo "  Backup of $(date)"
echo "==========================================="

# Create backup folder
mkdir -p ~/backups/$(date +%Y-%m-%d)

# Copies all script to backup folder
cp ~/devops-journey/scripts/*.sh ~/backups/$(date +%Y-%m-%d)/

#Counts of backups
COUNT=$(ls ~/backups/$(date +%Y-%m-%d)/ | wc -l)

echo ""
echo "$(date) Backed up $COUNT files successfully! ✅"
