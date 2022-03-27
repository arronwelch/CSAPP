#!/bin/bash

VAR="var test"
echo "start:${VAR}:end"
myUrl="https://www.google.com"
readonly myUrl
unset myUrl
myUrl="https://www.baidu.com"
