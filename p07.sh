#!/bin/bash
		clear

if [[ $EUID -ne 0 ]]
then 
		echo"Aquest Script nomes pot ser executat per root"
		exit 1
fi

DIRBACKUP=~/FitxConfBackup
if [[ ! -d $DIRBACKUP ]]
then
	mkdir $DIRBACKUP
fi


echo -n "Indica el dia: "
read dia
echo -n "Indica el mes (Jan/Feb/Mar/Apr/May/Jun/Jul/Aug/Sep/Oct/Nov/Dec): "
read mes

grep  -E "($mes $dia)" /var/log/user.log | grep "error" > $DIRBACKUP/err$mes$dia.log
# S'ha de posar "($mes $dia)" amb cometes dobles perquè amb cometes simple no canvia el nom de la variable pel seu valor
# El segon grep és perquè l'enunciat demana que els siguin missatge de tipus error.
exit 0

