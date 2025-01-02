#! /usr/bin/bash

awk '{print $1 " " $7 " " $9}' nginx-access.log > ip_path_status.log

COLUMNS=("1" "2" "3")
LABELS=(
	"Top 5 IP addresses with the most requests:"
 	"Top 5 most requested paths:"
 	"Top 5 response status codes:"
)

for i in "${!COLUMNS[@]}"; do  # COLUMNS[@} gives the array's values
	TOP_5=$(awk -v col="${COLUMNS[$i]}" '{print $col}' ip_path_status.log | 
		sort |
		uniq --count |
		sort -nr |
		head -n 5)

	echo "${LABELS[$i]}"
	echo "$TOP_5" | awk '{print $2 " - " $1 " requests"}'
	echo ""
done

echo "Top 5 user agents: "
awk -F '"' '{print $6}' nginx-access.log | sort | uniq --count | sort -nr | head -n 5 | awk '{print $2 " - " $1 " requests"}'
