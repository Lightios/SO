#!/bin/bash
while [ -n "$1" ]
do
	echo $1
   	cat "$1" | tr " " "\n" | sort | uniq -c | sort -r | head -n 3
   	shift
done
