@Scrivere ora un programma che sottrae il contenuto di due registri r3 e r4 e 
@scrive il contenuto in r1 (cioè r1=r3-r4).
@Utilizzare come valori iniziali r3=16, r4=3.

.text
.globl main
main:	mov r3, #16	@Carico il valore in r3
	mov r4, #3	@Carico il valore in r4
	sub r1, r3, r4	@Faccio la sottrazione in r1
	mov pc, lr	@Torno al sistema Operativo o al programma chiamante