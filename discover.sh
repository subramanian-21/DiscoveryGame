#!/bin/bash

declare -r  INPUT_MOVIES_PATH="/Users/subramani-22949/Applications/shell-scripts/discovery/movies.txt"
declare -i NO_OF_LINES=$(wc "$INPUT_MOVIES_PATH" | awk '{ print $1 }')
echo "Total Number of movies : $NO_OF_LINES"
declare -r RANDOM_NUMBER=$((RANDOM % NO_OF_LINES + 1 ))
MOVIE=$(sed -n "${RANDOM_NUMBER}p" "$INPUT_MOVIES_PATH")
declare -r MOVIE_NAME=$( echo "$MOVIE" | awk -F ' - ' '{ print $1 }')
declare -r MOVIE_DESC=$( echo "$MOVIE" | awk -F ' - ' '{ print $2 }')
echo "$MOVIE_NAME - $MOVIE_DESC"
chances=5
MOVIE_LENGTH="${#MOVIE_NAME}"
strSeq=""

playChance(){
        printf "Type Character :"
        read -n 1 char
        echo
        len=${#strSeq}
        for ((j=0;j<len;j++));
        do
                if [ "${strSeq:j-1:1}" == "$char" ]
                then
                        echo "Warning : Character already used"
			playChance
                        return
                fi
        done
        strSeq="$strSeq$char"
}


printBoard(){
	len="${#strSeq}"
	gotVal=0
	for j in $(seq 0 $((MOVIE_LENGTH-1)))
	do
		isFound=0
		for ((a=0;a<len;a++)) 
		do

			if [ "${MOVIE_NAME:j:1}" == "${strSeq:a:1}" ];
			then
				if [ "$a" -eq $((len - 1)) ]; then
    				gotVal="1"
				fi
				isFound="1"
				break
			fi
		done

		if [ "$isFound" -eq "1" ]
		then 
			printf " ${MOVIE_NAME:j:1} "
		else 
			printf " _ "
		fi			
	done
	if [ "$gotVal" -eq 0 ]; then
	chances=$((chances - 1))
	fi
	echo
}

while [ "$chances" -gt 0 ]
do 
	echo "**$chances Chances left**"
	printBoard
	playChance
	echo "$strSeq"
done

echo ""


