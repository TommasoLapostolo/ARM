@Scrivere ora un programma per calcolare il valore assoluto di una sottrazione
@di due interi con segno. Utilizzare i registri r1 e r2 per salvare
@i due operandi e il registro r0 per il risultato finale (cioè r0=|r1-r2|).
@Provare il codice prima con i valori r1=16 e r2=3, e poi con r1=2 e r2=18.

.text
.global main
main:	mov r1, #16	@inizializzo r1
	mov r2, #3	@inizializzo r2
	subs r0, r1, r2	@sottrazione condizionata
	submi r0, r2, r1@se negativo inverto gli operandi
	mov pc, lr	@ritorno