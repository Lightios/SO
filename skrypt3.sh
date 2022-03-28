#!/bin/bash
X=2
Y=$1
Y=$((Y+1))

while [ "$X" -lt  "$Y" ]
do
	IS_PRIME=1
	for ((i = 2; i < X; i++))
	do
		if ((X % i == 0))
		then
			IS_PRIME=0
			break
		fi
	done

	if ((IS_PRIME == 1))
	then
		echo $X
	fi

	X=$((X + 1))
done