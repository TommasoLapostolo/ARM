.text
.global find_max

@ Input:
@   * sp+12: indirizzo in memoria del vettore di interi con segno;
@   * sp+8: numero di elementi del vettore;

@ Output:
@   * r0: il valor massimo del vettore

find_max:	PUSH {fp, lr}	@operazioni per stack subroutine
		mov fp, sp
		PUSH {r1-r5}
		mov r2, #1	@inizializzo il contatore r2 a 1
		ldr r1, [fp, #8]@carico la dimensione del vettore in r1
		cmp r1, r2	@controllo che il vettore non sia nullo
                bls ff		@altrimenti termino
		add r5, fp, #12	@inidirizzo del primo elemeto nel vettore
		ldr r3, [r5]@primo valore in r3
		add r2, r2, #1	@incremento il contatore

loop:		cmp r1, r2	@ciclo
                bls fine
		ldr r4, [r5,#4]!@carico in r4 il valore successivo
		cmp r3, r4	@vediamo chi è il maggiore
		movlt r3, r4	@il più grande in r3
		add r2, r2, #1	@incrememnto il contatore
		b loop		@ripeti

fine:		mov r0, r3	@metto il più grande in r0
ff:		POP {r1-r5}
		POP {fp, lr}	@procedura standard subroutine
		mov pc, lr @ritorno