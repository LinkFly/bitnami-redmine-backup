#!/bin/bash
cd "$(dirname "$0")"
dir_arg="$1"
max_arg=$2

count=0
for f in $(ls -t "$dir_arg")
do
    if test $count -lt $max_arg
    then
	echo "Retain: "$dir_arg/$f""
    else
	echo "Deleting: "$dir_arg/$f""
	rm -f "$dir_arg/$f"
    fi
    count=$(( $count + 1 ))
done