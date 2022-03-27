# Shell Tutorial
## Shell Script:
	- Bourne Shell (/usr/bin/sh;/bin/sh)
	- Bourne Again Shell (/bin/bash)
	- C Shell (/usr/bin/csh)
	- K Shell (/usr/bin/ksh)
	- Shell for Root(/sbin/sh)
## first shell
	> chmod +x ./test.sh # change mode add executable permissions
	> ./test.sh # search from current directory '.'
	> which -a sh
	> /bin/sh test.sh # run with /bin/sh
	> which -a bash
	> /bin/bash test.sh # run with /bin/bash
## defination of varaible
	> lectter(underscore is lectter) and digit
	> no space between Lvalue=Rvalue.
	> e.g:
	>	var="This is a string"
## use of varaible
	> $var
	> ${var}
## readonly
	> #!/bin/bash
	>myUrl="https://www.google.com"
	>readonly myUrl
	>myUrl="https://www.baidu.com"
