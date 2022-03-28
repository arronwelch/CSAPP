#!/bin/bash
str='This is a single quote string'
echo $str
str="This is a double quote string"
echo $str
str=This_is_a_no_quote_string # no space
echo $str
# use double quote cat
str="{This is a cat string}"
catstr="Hello,"$str"with double quote !"'+single quote' # no space
echo $catstr
catstr='Hello, ${str} with variable name in single quote !' # single quote is proto print
echo $catstr
catstr="Hello, $str with variable name in double quote !" # variable replace
echo $catstr
echo "print catstr length:" ${#catstr} # print string length
