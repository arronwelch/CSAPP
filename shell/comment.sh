#!/bin/bash
#----------------------------------
# This is a comment
# author: stefan
# version: 1.0
# date: 2022-03-29
#----------------------------------

# multiple line comment:
:<<EOF
echo "comment is fail"
echo "comment is fail"
echo "comment is fail"
EOF


echo "This is start"

aaa="abc"

# multiple line comment use other flag: ' ` ~ ! name
:<<aaa
echo "comment is fail"
echo "comment is fail"
echo "comment is fail"
aaa

echo "This is end"
