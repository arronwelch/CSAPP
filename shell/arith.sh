#!/bin/bash
# Arithmetic Operators

val=`expr 2 + 2` # space between expr1 and expr2
echo "sum of 2 + 2 : $val"

a=10
b=20

echo "expr \$a + \$b : `expr $a + $b`"
echo "expr \$a - \$b : `expr $a - $b`"
echo "expr \$a \* \$b : `expr $a \* $b`"
echo "expr \$a / \$b : `expr $a / $b`"
echo "expr \$b / \$a : `expr $b / $a`"
echo "expr \$b % \$a : `expr $b % $a`"
a=$b

# equality operators: '==' '!=' ret true or false
if [ $a == $b ] # space in '[' 'expr1' '==' 'expr2' ']'
then
	echo "a equel to b"
fi

if [ $a != $b ]
then 
	echo "a not equel to b"
fi

