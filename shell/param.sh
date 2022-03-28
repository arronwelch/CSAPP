#!/bin/bash

echo "shell param test:"
echo "executable shell file name: $0"
echo "the first param: $1"
echo "the second param: $2"
echo "the third param: $3"
echo "the argc: $#"
echo "show the argv with a wholeString: $*"
echo "show the argv with a singleString: $@"
echo "the current bash pid: $$ $!"
echo "show: $- $?"

echo "only in double quote,show difference:"
echo "-- \$* demo ---"
for i in "$*";do
	echo $i
done


echo "-- \$@ demo ---"
for i in "$@";do
	echo $i
done
