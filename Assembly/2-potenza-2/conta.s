@ Controllare se un numero da 32bit è una potenza di due     
        .text
        .global conta
                     
        .type conta, %function

conta:  MOV r1, #0          @contatore
        MOV r2, #32         @numero di bit da contare

loop:   ANDs r3, r0, #1     @ guardo se la prima cifra è un 1
        ADDne r1, r1, #1    @ se si, aumento il contatore
        LSR r0, r0, #1      @ scarto la cifra controllata
        SUBs r2, r2, #1
        Bne loop
check:  CMP r1, #1
        MOVne r0, #0
fine:   MOV r0, r1
        MOV pc, lr
