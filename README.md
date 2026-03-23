9# Linux Server Monitoring & Automation

Collection of bash automation scripts for Linux server health monitoring, service management and automated backups.

## Tools & Technologies
![Bash](https://img.shields.io/badge/Bash-4EAA25?style=flat&logo=gnu-bash&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-FCC624?style=flat&logo=linux&logoColor=black)
![Git](https://img.shields.io/badge/Git-F05032?style=flat&logo=git&logoColor=white)

## Projects

### 🖥️ Server Monitor Dashboard
Automated monitoring solution for Linux servers

**Features:**
- Disk, memory, CPU monitoring with configurable thresholds
- Service health checks with alerts
- Timestamped logging system
- Warning counter with summary report
- Cron automation

**Usage:**
```bash
./scripts/server_monitor.sh
```

**Sample Output:**
```
[2026-03-23 13:33:03] SERVER MONITOR STARTING
[2026-03-23 13:33:03] OK: / disk at 8%
[2026-03-23 13:33:03] OK: /boot/efi disk at 2%
[2026-03-23 13:33:03] OK: memory is 58%
[2026-03-23 13:33:04] OK: CPU is 14%
[2026-03-23 13:33:04] OK: docker is RUNNING
[2026-03-23 13:33:04] WARNING: nginx is STOPPED
[2026-03-23 13:33:04] TOTAL WARNINGS: 1
```

---

### 🔍 Service Health Checker
Monitors critical system services automatically

**Features:**
- Loops through configurable service list
- Clear RUNNING/STOPPED status reporting
- Easy to extend with new services

**Usage:**
```bash
./scripts/service_checker.sh
```

---

### 💾 Automated Backup System
Scheduled backup solution with logging

**Features:**
- Automated daily backups via cron
- Date-based folder organization
- Complete activity logging

**Usage:**
```bash
./scripts/backup.sh
```

---

### 🖥️ Disk Alert Monitor
Disk usage monitor with threshold alerts

**Features:**
- Monitors multiple partitions
- Configurable alert threshold
- Professional error handling

**Usage:**
```bash
./scripts/disk_alert.sh
```

---

## Skills Demonstrated
- Bash scripting best practices
- Error handling (set -e, set -u)
- Functions, arrays and loops
- Timestamped logging with tee
- Cron job automation
- Git version control with branching
- Linux system administration

## Repository Structure
```
devops-journey/
├── scripts/     → automation scripts
├── logs/        → generated log files
└── notes/       → documentation and flashcards
```

## Daily Progress
Learning journal available in [notes/progress.md](notes/progress.md)
