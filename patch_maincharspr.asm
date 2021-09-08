org   0x0000

BITS 16
CPU 286


section .calloverride_save start=0x4423

                                ; original
                                ; call  s_gfx_adjust_colours_9D45

                                call    save_mainchar_seg_then_adjust


section .calloverride_start start=0x4a67

                                ; original
                                ; call  s_gfx_adjust_colours_9D45

                                call    save_mainchar_seg_then_adjust


;; repurpose the teleport to room code

; 555 bytes
;; first from 5a49 
;; end at     5c79
section .unused start=0x5a49

save_mainchar_seg_then_adjust:
                                pusha
                                mov     [seg_mainchar], ax
                                call    s_gfx_adjust_colours_9D45
                                popa
                                retn
                                

absolute 0x9d45
s_gfx_adjust_colours_9D45:


;; technically data section

absolute 0x97E4
    seg_mainchar resw 1
