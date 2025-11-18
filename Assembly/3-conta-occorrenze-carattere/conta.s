                .text
                .global conta
                .type conta, %function
                @ r0 indirizzo della stringa

conta:          PUSH {r4-r6,lr}
                MOV r4, r0          @ salvo in r4 l'indirizzo della stringa
                MOV r0, #26         @ salvo 26 in r0, ovvero il numero di interi (lettere) del vettore di output
                LSL r0, #2          @ ogni intero sono 4 byte quindi moltiplico per 4
                BL malloc           @ chiamo malloc(r0) -> r0
                MOV r5, r0          @ salvo il valore di ritorno di malloc
                CMP r5, #0          @ controllo che il puntatore sia diverso da null
                Beq errore          @ se il puntatore è null, esco
                MOV r1, #26         @ numero di lettere da checkare
                MOV r2, #0          @ valore da assegnare agli elem del vettore
                MOV r3, r5          @ puntatore per il vettore di numeri

vecset:         CMP r1, #0          @ controllo se l'iteratore è arrivato a 0
                Beq body            @ se abbiamo finito di inizializzare il vettore, passo alla fase successiva
                STR r2, [r3], #4    @ altrimenti salvo in ogni cella del vettore r2, ovvero 0
                SUB r1, #1          @ decremento l'iteratore
                B vecset            @ ricomincio il giro

body:           LDRB r0, [r4], #1   @ salvo in r0 un carattere della stringa e incremento di 1 r4 (dimensione char)
                CMP r0, #0          @ controllo se il carattere è null
                Beq fine            @ se lo è vuol dire che la stringa è finita
                BL parsechar

parsechar:      CMP r0, #'A'        @ controllo se il carattere viene prima della A
                BLT non-lett        @ se si, non è una lettera
                CMP r0, #'Z'        @ se viene prima di Z allora è maiuscola
                BLT minuscola       @ 

fine:           MOV r0, r5          @ metto nell'indirizzo di ritorno l'inizio del vettore di numeri
                POP {r4-r6, pc}     @ torno al chiamante


errore:         MOV r0, #-1         @ imposto -1 come valore di ritorno
                POP {r4-r6, pc}     @ ritorno al chiamante

non-lett:       MOV r0, #-1
                MOV pc, lr