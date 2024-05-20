@Programma che carica 10 parola in memoria caricandole in una matrice L=4, C=5, R=2;
@Poi si scelgono 2 righe (r1,r2) e due colonne (c1,c2) e si scambiano le parole di queste cordinate
.data
frase:	.ascii	"raromanocarolamaninonasoditopeloranatopo"
		.word	0
O:	.word	m,	m+(C*L)		

.bss
.equ	L,	4
.equ	R,	2
.equ	C,	5
m:	.space	L*R*C

.text
.global main
main:	ldr r0, =m	@Carico l'indirizzo della matrice in r0
		ldr r3, =O	@Carico i puntatori in r3
		ldr r4, =frase	@Carico l'indirizzo della frase in r4
		PUSH {r4}	@Carico l'indirizzo iniziale della matrice
		mov R1, #0	@Contatore R1 inizializzato a 0

carica:	ldr r2, [r4, r1]	@Carico 4 lettere correnti della frase in R2
		cmp r2, #0x0000	@Verifico che non sia l'ultima
		BEQ avanti	@Se è l'ultima salto
		str r2, [r0, r1]	@carico i 4 caratteri correntt nella matrice
		add r1, r1, #4	@Procedo di 4 posizioni
		B carica	@Ripeto

avanti:	POP {r4}
		@Provo a fare qualche operazioni con la matrice, r in R5, c in R6;
		mov r5, #1	@riga recupero in r5
		mov r6,	#4	@colonna recupero in r6
		mov r5, r5, lsl #2	@converto i in indirizzo
		ldr r5, [r3, r5]	@carico indirizzo di riga [O+i]
		add r7,	r5,	r6, lsl #2	@aggiorno l'indirizzo aggiungendo le righe [[O+i]+[j*L]]
		Push {r7}	@salvo l'indirizzo
		ldr r7, [r7]	@salvo in r7 la parola
		Push {r7}	@salvo la parola
		mov r5, #0	@riga scambio r5
		mov r6,	#2	@colonna scambio in r6
		mov r5, r5, lsl #2	@converto i in indirizzo
		ldr r5, [r3, r5]	@carico indirizzo di riga [O+i]
		add r7,	r5,	r6, lsl #2	@aggiorno l'indirizzo aggiungendo le righe [[O+i]+[j*L]]
		ldr r8, [r7]	@salvo in r8 la parola
		pop {r9}	@mi riprendo la parola precedente in r9
		str r9, [r7]	@la salvo nel secondo indirizzo contenuto in r7
		pop {r7}	@metto il primo indirizzo in r7
		str r8, [r7]	@salvo la seconda parola nel primo indirizzo
trap:	B trap