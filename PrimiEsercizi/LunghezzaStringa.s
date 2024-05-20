@Si vuole scrivere un programma che calcoli la lunghezza di una stringa.

.data
stringa:	.ascii "Questa stringa e' lunga 36 caratteri"
			.byte 0 @ EOS
			.align

.bss
output:	.skip 4 @ Uso una word per salvare in memoria la lunghezza

.text
.global main
main:	MOV R0, #0 @ Inizializzo a 0 il contatore
		LDR R1, =stringa @ Carico la frase + EOS in R1
		
ciclo:	LDRB R2, [R1] @ Carico un byte della frase in R2
		CMP R2, #0 @ Verifico se R2 == 0
		BEQ fine	@ Se sì termino
		ADD R0, R0, #1 @ Incremento il contatore
		ADD R1, R1, #1 @ Incremento il carattere
		B ciclo @ Ripeto il ciclo
		
fine:	LDR R3, =output
		STR R0, [R3]
trap:	B trap