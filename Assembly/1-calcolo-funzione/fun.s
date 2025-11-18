@ Implementare una funzione che calcola
@ fun(x) = (x * 3 + 1) / 4

        .text
        .global fun @ r0 <- numero n di cui calcolare il fattoriale
                     @ r0 <- risultato (fattoriale)
        .type fun, %function

fun:    LSL r1, r0, #1 @x*2
        ADD r1, r1, r0 @x*2 + x = 3x
        ADD r1, r1, #1 @3x + 1
        ASR r0, r1, #2 @/4
        MOV pc, lr
        