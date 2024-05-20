.text
.global find_max

@ Input:
@   * r0: indirizzo in memoria del vettore di interi con segno;
@   * r1: numero di elementi del vettore;

@ Output:
@   * r0: il valor massimo del vettore

find_max:	PUSH {r1-r4}
		mov r2, #1	@inizializzo il contatore r2 a 1
		cmp r1, r2	@controllo che il vettore non sia nullo
                bls ff		@altrimenti termino
		ldr r3, [r0]	@primo valore in r3
		add r2, r2, #1	@incremento il contatore

loop:		cmp r1, r2	@ciclo
                bls fine
		ldr r4, [r0,#4]!@carico in r4 il valore successivo
		cmp r3, r4	@vediamo chi è il maggiore
		movlt r3, r4	@il più grande in r3
		add r2, r2, #1	@incrememnto il contatore
		b loop		@ripeti

fine:		mov r0, r3	@metto il più grande in r0
ff:		POP {r1-r4}
		mov pc, lr @ritorno