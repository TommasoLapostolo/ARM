@ Sviluppare un codice ARM che, dato un carattere in
@ input, controlla se il carattere è una lettera
@ minuscola oppure no
@ • Il carattere di input è in R0
@ • Al termine del programma, in R1 avremo 1 se il
@ carattere era minuscolo, 2 se non lo era

.text
.global main
main:	
	MOV R0, #0x6d @ Inserisco una lettera a scelta in R0
	MOV R1, #2 @ Inserisco già il valore 2 in R1 così devo solo modificare il valore se il carattere è minuscolo
	MOV R2, #96 @ Inserisco in R2 un valore ascii che è maggiore delle lettere maiuscole e minore di quelle minuscole
	
	CMP R0, R2 @ Confronto il carattere inserito con il valore arbitrario da me scelto
	MOVHI R1, #1	@ Modifico R1 a 1 se il carattere è maggiore
	
	NOP