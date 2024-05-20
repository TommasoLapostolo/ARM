@Programma che data una frase converte gli " " in "_"

.data
frase: .ascii "Domani piove zio pera"

.bss
spazio: .space 21

.text
.equ dim, 21 @dimensione frase sopra
.equ val, 0x5f @hex della "_"
.equ v, 0x20 @hex dello " "

.global main
main:	LDR R10, =frase @carico l'indirizzo della frase, in R10
		LDR R9, =spazio @carico l'indirizzo di dove salvo, in R9
		MOV R0, #0 @inizializzo il contatore a 0

ciclo:	ADD R0, R0, #1 @incremento il contatore
		LDRB R2, [R10], #1 @carico in R2 il byte corrente di R10 e poi incremento R10
		
		CMP R2, #v @confronto il carattere contenuto in R2 con l'hex dello spazio
		MOVEQ R2, #val @se c'è uno spazio in quel byte lo sostituisco
		
		STRB R2, [R9], #1 @salvo in memoria il byte contenuto in R2 e poi incremento R9
		
		CMP R0, #dim @confronto il contatore e la dimensione
		BLO ciclo
		
		NOP