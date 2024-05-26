.text
.global find_max

@ Input:
@   * sp+8: indirizzo in memoria del vettore di interi con segno;
@   * sp+12: numero di elementi del vettore;

@ Output:
@   * r0: il valor massimo del vettore

find_max:
    PUSH {fp, lr}           @ operazioni per stack subroutine
    mov fp, sp
    PUSH {r1-r5}
    mov r2, #0              @ inizializzo il contatore r2 a 0
    ldr r1, [fp, #12]       @ carico la dimensione del vettore in r1
    cmp r1, r2              @ controllo che il vettore non sia nullo
    ble ff                  @ altrimenti termino
    ldr r5, [fp, #8]        @ carico l'indirizzo del vettore in r5
    ldr r3, [r5], #4        @ primo valore in r3 e incremento l'indirizzo
    add r2, r2, #1          @ incremento il contatore

loop:
    cmp r1, r2              @ ciclo
    beq fine
    ldr r4, [r5], #4        @ carico in r4 il valore successivo e incremento l'indirizzo
    cmp r3, r4              @ vediamo chi è il maggiore
    movlt r3, r4            @ il più grande in r3
    add r2, r2, #1          @ incremento il contatore
    b loop                  @ ripeti

fine:
    mov r0, r3              @ metto il più grande in r0
ff:
    POP {r1-r5}
    mov sp, fp
    POP {fp, lr}            @ procedura standard subroutine
    mov pc, lr              @ ritorno