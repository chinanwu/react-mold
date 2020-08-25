#!/bin/bash
input="./src/styles/coloursv2.less"
output="./src/resources/Colours.js"
# pat='^\W{1}\w$'
# pat='\@{1}([a-z]|\-)*\w+'
patForName='\@{1}.*\:'
patForHex='\#{1}.*\;'
patForExclude='\@{1}.*\:\s\@{1}.*\;'
if [ -f "$output" ]
then
  echo "Output exists, removing"
  rm "$output"
fi
touch "$output"

while IFS= read -r line
do
	if [[ $line =~ $patForExclude ]]
	then
		echo "skip"
	elif [[ $line =~ $patForName ]]
	then
		# Get constant name
		string=${BASH_REMATCH[0]}
		substr=${string:1:${#string}-2}
		# echo "${string:1:${#string}-2}"
		# echo "$substr"
    #	constName=${substr//-}
    # Can't do camelcase without it being a lot of work, so just living with this for now
		constName=${substr//-/_}
		# echo "$constName"

		# Get colour string
		if [[ $line =~ $patForHex ]]
		then
			hexStr=${BASH_REMATCH[0]}
			# subHexStr=${hexStr:1:${#hexStr}-2}
			subHexStr=${hexStr::${#hexStr}-1}
			# echo "$subHexStr"

			echo "export const $constName = \"$subHexStr\";" >> "$output"
		fi
	fi
done < "$input"

# [[ $line =~ \W{1}\w+ ]]
# echo "${BASH_REMATCH[1]}"
# echo $line
