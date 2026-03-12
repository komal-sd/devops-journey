# My DevOps Command Cheatsheet

## grep
grep -c "word" file        # count matches
grep -i "word" file        # case insensitive
grep -n "word" file        # show line numbers
grep -v "word" file        # exclude matches
grep -r "word" /dir/       # search in directory
grep -a "word" binaryfile  # treat binary as text

## awk
awk '{print $1}'           # print column 1
awk '$4 > 1.0'             # filter by column value
awk '{sum+=$4} END {print sum}'  # calculate total
NR = number of rows
NF = number of fields/columns

## sed
sed 's/old/new/' file      # replace first occurrence
sed 's/old/new/g' file     # replace all occurrences
sed -i 's/old/new/' file   # save changes to file
sed '3d' file              # delete line 3
sed -n '2p' file           # print only line 2

## redirection
>   overwrite file
>>  append to file
2>  redirect errors
2>/dev/null  discard errors
2>&1  merge errors with output

## if/else conditions
if [ $VAR -gt 80 ]; then    # greater than
elif [ $VAR -gt 60 ]; then  # else if
else                         # default
fi                           # end if block

## comparison operators
# -gt greater than
# -lt less than
# -eq equal to
# -ne not equal
# -ge greater or equal

## IMPORTANT RULES
# Spaces inside [ ] are MANDATORY
# fi closes every if block

## math
$((5 * 10))     # multiply
$((10 / 2))     # divide
$((10 % 3))     # remainder

## tr command
tr -d '%'       # delete character

## loops
# for loop
for item in list; do
    action
done

# for loop with range
for i in {1..10}; do
    action
done

# while loop
while [ $COUNT -le 5 ]; do
    action
    COUNT=$((COUNT + 1))   # NEVER forget this!
done

# IMPORTANT: forgetting to increment = infinite loop
# Fix infinite loop: Ctrl+C


## Process Management
ps aux | grep Z              # find zombie processes
ps -o ppid= -p PID          # find parent of process
kill -9 PID                  # force kill process
kill -s SIGCHLD 1            # signal systemd to clean
