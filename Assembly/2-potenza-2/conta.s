@ Controllare se un numero da 32bit è una potenza di due     
        .text
        .global conta
                     
        .type conta, %function

conta:  MOV r1, #0          @contatore di 1
        MOV r2, #32         @numero di bit da contare

loop:   ANDs r3, r0, #1     @ guardo se la prima cifra è un 1
        ADDne r1, r1, #1    @ se si, aumento il contatore
        LSR r0, r0, #1      @ scarto la cifra controllata
        SUBs r2, r2, #1     @ decremento l'iteratore
        Bne loop            @ se il risultato della SUB non è 0, torno a loop
check:  CMP r1, #1          @ controllo se il numero di 1 è 1 (il numero è potenza di due)
        MOVne r0, #0        @ se non è vero scrivo 0 nel risultato (falso)
fine:   MOV r0, r1          @ sposto il contatore nel risultato
        MOV pc, lr          @ ritorno al chiamante
