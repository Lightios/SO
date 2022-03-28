#!/bin/bash
X=$1
while [ -n "$2" ]
do
	cp "$X" "$2"
	shift
done