@ Programma che data una frase la scrive al contrario

.data
	frase: .ascii "Ciao Mondo!"

.bss
	output: .space 11

.text
.equ dim, 11
.global main
main:	LDR R10, =frase @registro che contiene l'indirizzo di input	R10
		LDR R9, =output @registro che contiene l'indirizzo di output R9
		MOV R0, #0 @inizializzo il contatore a 0	contatore R0
		ADD R9, R9, #dim @mi porto sull'ultimo byte dell'output

		
ciclo:	ADD R0, R0, #1 @incremento il contatore
		
		LDRB R2, [R10], #1 @Salvo il byte corrente in R2 e poi mi punto R10 a quello successivo
		STRB R2, [R9] @Carico il byte contenuto in R2 in memoria e decremento la posizione
		SUB R9, R9, #1
		
		CMP R0, #dim @confronto e nel caso rieseguo il ciclo
		BLO ciclo @eseguo il ciclo solo se R0 è minore strettamente di dim
		
		NOP