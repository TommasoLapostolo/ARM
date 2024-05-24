.data
num:	.word 0xE65DC7AA
.text
.global main
main:	PUSH {fp, lr}
	mov fp, sp		@procedura standard subroutine
	PUSH {r0}		@salvo i registri
	ldr r0, =num		@inizializzo r0: 0x---10101010
	ldr r0, [r0]		@caricato dalla memoria
	bl complemento		@chiamola funzione
	POP {r0}		@riprisrino i registri
	POP {fp, pc}		@ritorno