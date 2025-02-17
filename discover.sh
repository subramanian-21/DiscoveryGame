#!/bin/bash

declare -r  INPUT_MOVIES_PATH="/Users/subramani-22949/Applications/shell-scripts/movies.txt"
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
	
	for j in $(seq 1 "$MOVIE_LENGTH") 
	do
		for ((k=0;k<))
	done
}

for i in $(seq "1" "$chances")
do 
	playChance
	echo "$strSeq"
done

echo ""


