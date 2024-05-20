.data
	addr_n: .word 10	@ Word in memoria con il valore di n

.bss
	addr_sum: .skip 4	@ Word in memoria dove salvare il valore finale

.text
	.global main
main:
	mov r1, #1	@inizializzo il contatore in r1
	ldr r2, =addr_n	@carico l'inidirro di input in r2
	ldr r2, [r2]	@carico il valore in r2
	ldr r0, =addr_sum @carico l'inidrizzo di output in r0
	mov r3,#0
	cmp r2, r3	@vedo se il numero inserito va bene
	bls fine

loop:	cmp r1, r2	@vedo se il contatore ha superato il valore
	bhi fine	@se sì termino
	mul r4, r1, r1
	add r3, r3, r4
	add r1, r1, #1
	b loop		@ripeto il ciclo do-while

fine:	str r3, [r0]	@carico il risultato in memoria
	mov pc, lr	@ritorno