org   0x0000

BITS 16
CPU 286

absolute 0x2CB6 
s_roland_port_2CB6: ;ret

absolute 0x2CC5
s_roland_2CC5: ;ret

section .roland start=0x2CE3

midi_all_sound_off                  equ         0x78    ;; not recognised by mt-32
midi_all_notes_off                  equ         0x7B

midi_channel_first                  equ         0xB0
midi_channel_last                   equ         0xB8  ;; mdw only uses 8 chans

; original:
; segcode:2CE0  xx xx xx 50 51 52 B9 08  00 B8 B0 00 50 E8 D5 FF
; segcode:2CF0  58 E8 C2 FF 86 E0 E8 BD  FF 86 E0 FE C0 E2 ED 5A
; segcode:2D00  59 58 C3

s_roland_stop_audio_2CE3:               pusha

                                        mov     cl, midi_channel_first
                             
                         stop_loop:     call    s_roland_2CC5

                                        mov     al, cl
                                        call    s_roland_port_2CB6
                                        mov     al, midi_all_notes_off
                                        call    s_roland_port_2CB6    
                                        xor     al,al
                                        call    s_roland_port_2CB6    

                                        inc     cl
                                        cmp     cl, midi_channel_last
                                        jbe     stop_loop

                                        popa
                                        retn

                                        nop
                                        nop
