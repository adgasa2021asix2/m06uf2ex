#!/bin/bash
#

clear
REGEX='^[A-Z0-9a-z._%+-]+@[A-Z0-9a-z.-]+\.[A-Za-z]{2,63}$'

if [ $EUID -ne 0 ]
then
    echo "No tens permisos per executar l'script"
    exit 1
fi

for mail in $(cut -d ' ' -f 1 mails.tmp)
do
	if [[ $mail =~ $REGEX ]]
	then    
		echo "$mail"  >> /etc/blackmail.list	
	fi
done
exit 0
exit 5
