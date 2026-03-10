#!/bin/bash
read -p "Enter a number: " NUM

if [ $NUM -gt 100 ]; then
	echo " This is a Large number!"
elif [ $NUM -gt 50 ]; then
	echo "This is a medium number!"
elif [ $NUM -gt 0 ]; then
	echo "This is a small number!"
else
	echo "This is Invalid number"
fi

