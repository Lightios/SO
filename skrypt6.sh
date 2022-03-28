#!/bin/bash

X=$(($1 * 2))

if (( $1 == $X ))
then
	echo "string"
else
	echo "liczba"
fi