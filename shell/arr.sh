#!/bin/bash
array_name=(1 12 123) 	# define a array with 3 member
echo $array_name[0]		# print the first member(X)
echo ${array_name[0]}	# print the first member(V)
array_name[1]=2112		# modified the menber
echo ${array_name[1]}
echo ${array_name[2]}
echo ${array_name[@]}	# print all member

echo ${#array_name[@]}	# count array length 
echo ${#array_name[*]}	# count array length 
echo ${#array_name[1]}	# count the first member length
