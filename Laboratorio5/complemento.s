@Complemento dell'ultimo byte del registro r0ù
.text
.equ ff, 0xFF
.global complemento
complemento:	PUSH {fp, lr}
		mov fp, sp		@passaggi standard subroutine
		PUSH {r1}		@salvo i registri che vado a modificare
		and r1, r0, #ff		@maschera ultimo byte in r1
		mvn r1, r1		@complementare in r1
		and r1, r1, #ff		@ultimo B di r1 in r1
		bic r0, r0, #ff		@primi 3B di r0 in r0
		add r0, r0, r1		@li sommo
		POP {r1}		@ripristino
		POP {fp, pc}		@ritorno
