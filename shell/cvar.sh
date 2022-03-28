#!/bin/bash
# global d variable
d=/apache.jail

# User defined function
create_jail(){
	# d is only visible to this function
	local d=$1
	echo "create_jail(): d is set to $d"
}

echo "Before calling create_jail d is set to $d"

create_jail "/home/apache/jail"

echo "After calling create_jail d is set to $d"
