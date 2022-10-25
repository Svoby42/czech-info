#!/bin/bash
soubor=$1
echo "" > result.txt
while read -r line
do
  # -L : follow redirects, -s : be silent, -m 1 :skip request if not successful after 1 second
	curl -Lsm 1 $line | grep -a "<title>" | sed -e 's/<[^>]*>//g' >> result.txt
done < $soubor
echo "Results saved to result.txt"
