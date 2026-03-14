# Command Flashcards — Practice Daily!

## Process Management
Q: Find zombie processes?
A: ps aux | grep Z

Q: Find parent of a process?
A: ps -o ppid= -p PID

Q: Kill a process?
A: kill -9 PID

Q: Top 5 memory processes?
A: ps aux --sort=-%mem | head -5

## Find Command
Q: Find files larger than 100MB?
A: find / -size +100M 2>/dev/null

Q: Find files modified in last 7 days?
A: find / -mtime -7 2>/dev/null

Q: Find all .sh files?
A: find ~/devops-journey -name "*.sh"

## Cron
Q: Run every hour?
A: 0 * * * *

Q: Run every day at 7AM?
A: 0 7 * * *

Q: Run every 30 minutes?
A: */30 * * * *

Q: List all cron jobs?
A: crontab -l

## grep
Q: Count matches in file?
A: grep -c "pattern" filename

Q: Search recursively?
A: grep -r "pattern" /path

Q: Find lines NOT containing word?
A: grep -v "pattern" filename

## Disk/Memory
Q: Check disk usage?
A: df -h

Q: Check memory?
A: free -h

Q: Find largest files?
A: find / -size +100M 2>/dev/null
