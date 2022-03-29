#!/bin/bash

# Boolean Operators

a=10
b=20
#if [ ! $a == $b ]
#if [ ! $a -eq $b ]
if test ! $a -eq $b
then
	echo "logical negation: $a != $b"
else
	echo "logical negation: $a == $b"
fi

#if [ $a -lt 100 -a $b -gt 15 ]
#if [ $a -lt 100 ] && [ $b -gt 15 ]
if [[ $a -lt 100 && $b -gt 15 ]]
then
	echo "$a is less than 100 and $b greater than 15: return true"
else
	echo "$a is less than 100 and $b greater than 15: return false"
fi

if [ $a -lt 100 -o $b -gt 100 ]
then
	echo "$a less than 100 or $b greater than 100: return true"
else
	echo "$a less than 100 or $b greater than 100: return false"
fi

if [ $a -lt 5 -o $b -gt 100 ]
then
	echo "$a less than 5 or $b greater than 100: return true"
else
	echo "$a less than 5 or $b greater than 100: return false"
fi

