#!/bin/bash
		clear

if [[ $EUID -ne 0 ]]
then 
		echo"Aquest Script nomes pot ser executat per root"
		exit 1
fi

echo "Sisplau introdueïx l'usuari: "
read usuari
echo "Sisplau introdueïx la nova contrasenya: "
read -s contrasenya1
echo "Sisplau torna a repetir la nova contrasenya: "
read -s contrasenya2
# Comprovació que les dues contrasenyes son iguales
if [ $contrasenya1 != $contrasenya2 ]; then
	echo "Les contrasenyes no son iguales"
	exit
fi

#Comprovacio si l'usuari existeix 
id $usuari&> /dev/null
if [ $? -eq 0 ]; then
	echo "$username existeix... canviant la contrasenya."
else
	echo "$username no existeix - la contrasenya no es pot actualitzar"; exit 
fi # Canvi de contrasenya
echo -e "$contrasenya1n$contrasenya1" | passwd $usuari

exit 1
