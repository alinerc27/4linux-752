#!/bin/bash

for NOME in $(getent passwd | awk -F: '$3 >= 1000 { print $1 }' | egrep -v "nobory|vagrant|suporte")
do
	echo $NOME 'criando diretorio...'
	maildirmake /home/${NOME}/Maildir
	maildirmake /home/${NOME}/Maildir/.Enviados
	maildirmake /home/${NOME}/Maildir/.Rascunhos
	maildirmake /home/${NOME}/Maildir/.Lixeira
	maildirmake /home/${NOME}/Maildir/.Spam
	echo $NOME 'alterando dono'
	chown ${NOME}: /home/${NOME} -R

done
