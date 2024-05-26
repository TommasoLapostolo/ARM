add r5, fp, #8	@indirizzo del primo elemeto nel vettore
Questo é sbagliato, l'operazione corretta è:
ldr r5, [fp, #8]
ldr r3, [r5], #4