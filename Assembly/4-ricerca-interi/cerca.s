            .text
            .global cerca
            .type cerca, %function

            @r0 = x; r1 = *v; r2 = n;

cerca:          CMP r1, #0                  @ controllo se il vettore è null
                Beq errore                  @ se sì, esco
                PUSH {r4}                   @ salvo r4 per usarlo
                MOV r3, #0                  @ r3 = i

loop:           LDR r4, [r1, r3, lsl #2]    @ carica in r4 r1 + r3 e poi fai l3 * 4 per andare alla locazione successiva
                CMP r4, r0                  @ controllo se v[i] == x
                Beq trovato                 @ se sì vado a trovato
                ADD r3, r3, #1              @ incremento i di 1
                CMP r3, r2                  @ controllo se i == n
                Beq non_trovato             @ se sì siamo arrivati alla fine e non abbiamo trovato il valore
                B loop                      @ ricomincia con il loop

non_trovato:    MOV r0, #-1                 @ metto -1 come valore di ritorno
                B fine                      @ vado al blocco di fine
            
trovato:        MOV r0, r3                  @ metto nel valore di ritorno la posizione 
                B fine                      @ vado al blocco di fine

            
fine:           POP {r4}                    @ rimetto r4 come era prima dell'esecuzione del programma
                MOV pc, lr                  @ ritorno

errore:         MOV r0, #-2                 @ metto come valore di ritorno -2
                MOV pc, lr                  @ ritorno
