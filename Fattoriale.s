@ Si vuole scrivere un programma che calcoli il fattoriale di un numero
.data
num: .word 0x0b @ Carico il numero 11 in memoria

.bss
output: .skip 4 @ Alloco una word in memoria

.text
.equ max, 0x0c @ Massimo valore di cui si può calcolare il fattoriale usando una word (12)
.global main
main:	LDR R2, =num @ Carico il numero in R2
		LDR R2, [R2]
		MOV R0, #0 @ Inizializzo R0 = 0, mi servirà in caso io non possa calcolare il fattoriale in una word
		CMP R2, #max @ Verifico che il numero inserito sia minore di 13
		BHI fine @ Se non lo è termino
		MOV R0, R2 @ Carico il primo valore in R0
		
ciclo:	SUB R2, R2, #1 @ Diminuisco il valore inserito
		CMP R2, #0 @ Verifico se sono arrivato a 0
		BLS fine @ In caso termino
		MUL R0, R0, R2 @ Sennò moltiplico il valore corrente per i precedenti
		B ciclo @ ripeto

fine:	LDR R3, =output @ Salvo l'indirizzo di output memoria in R3
		STR R0, [R3] @ Carico il fattoriale in memoria
trap:	B trap @ fine programma con loop
@39916800 valore di 11!
@479001600 valore di 12!