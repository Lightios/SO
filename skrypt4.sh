X=$(cat $0)

i=0
while [[ ${X:i:1} != "" ]]
do
	i=$((i + 1))
done

for ((z = i; z >= 0; z--))
do
	printf "${X:z:1}" 
done

echo ""
