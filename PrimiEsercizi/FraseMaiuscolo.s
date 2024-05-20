@ • Sviluppare un codice ARM che data una stringa
@ ascii, la riscrive tutta in maiuscolo
@ • La stringa è "Ciao mondo!"
@ • Dovremo:
@ • Dire ad ARM di memorizzare la stringa di input in
@ memoria
@ • Allocare uno spazio in memoria dove memorizzare la
@ stringa di output
@ • Leggere un carattere alla volta e, se minuscolo,
@ trasformarlo in maiuscolo, e poi scriverlo in output 

.data
	stringa: .ascii "Ciao mondo!" @ Stringa da convertire in maiuscolo
	
.bss
	output: .skip 11 @ Spazio che necessito disponibile per il salvataggio del risultato

.equ lString, 11

.text
.global main
main:	LDR R5, =stringa @ Carico l'indirizzo della frase in R5
		LDR R6, =output @ Carico l'indirizzo output in R6

		MOV R0, #1 @ Contatore in R0 inizializzato a 1

ciclo:	LDRB R1, [R5], #1 @ Prendo il primno byte di R5 e lo salvo in R1 e poi incremento R5 per spostare 1Byte e trovarmi poi al Byte successivo
		ADD R0, R0, #1 @ Incremento di 1 R0, il contatore
		
		CMP R1, #0x60 @ Confronto se maiuscolo o minuscolo
		SUBHI R1, R1, #32 @ Nel caso di minuscolo converto in maiuscolo
		STRB R1, [R6], #1 @ Prendo il byte salvato in R1 e lo carico nell'indirizzo contenuto in R6 e poi incremento R6 per spostare 1Byte e trovarmi poi al Byte successivo
		
		CMP R0, #lString @ Trovo la differenza tra R0, il contatore, e la lunghezza della stringa
		BLS ciclo @ Se il contatore è minore itero la procedura
		
		NOP