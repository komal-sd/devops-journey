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

## Common Mistakes
- find -mtime → NO 'd' at end! Just number
- ps -o ppid= -p → space needed after =
- grep pattern → lowercase always
- find size → M not MB!

## Bash Scripting
Q: How to define array?
A: ARRAY=("item1" "item2" "item3")

Q: How to loop through array?
A: for ITEM in "${ARRAY[@]}"; do

Q: What does set -e do?
A: Stops script if any command fails

Q: What does set -u do?
A: Stops script if undefined variable used

Q: How to do math in bash?
A: RESULT=$((5 + 3))

Q: How to capture command output?
A: RESULT=$(command)

Q: How to log with timestamp?
A: echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a logfile

Q: How to count warnings?
A: WARNINGS=$((WARNINGS + 1))

## Git
Q: Create new branch?
A: git checkout -b branch-name

Q: Merge branch to main?
A: git checkout main && git merge branch-name

Q: Save work temporarily?
A: git stash

Q: Restore stashed work?
A: git stash pop

Q: See commit history?
A: git log --oneline

Q: See what changed in file?
A: git diff filename
