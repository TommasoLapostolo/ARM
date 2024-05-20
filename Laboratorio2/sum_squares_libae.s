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
	ldr r3, =addr_sum @carico l'inidrizzo di output in r0
	mov r0,#0
	cmp r2, r0	@vedo se il numero inserito va bene
	bls fine

loop:	cmp r1, r2	@vedo se il contatore ha superato il valore
	bhi fine	@se sì termino
	mul r4, r1, r1	@faccio il quadrato
	add r0, r0, r4	@somma parziale
	add r1, r1, #1	@incremento il contatore
	bl print_int	@stampo a video
	b loop		@ripeto il ciclo do-while

fine:	str r0, [r3]	@carico il risultato in memoria
	bl exit_program	@ritorno