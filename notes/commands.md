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
