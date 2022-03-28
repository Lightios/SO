# id procesu jako parametr, wypisac t/n, jest/dziala czy nie

X=$(ps | grep "^$1 " | wc -l)

if ((X == 0))
then
	echo nie
else
	echo tak
fi