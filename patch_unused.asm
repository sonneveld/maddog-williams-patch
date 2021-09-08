org   0x0000

BITS 16
CPU 286


;; marking out interesting unused sections in the mdwvga.exe binary


; 191 bytes
section .unused3 start=0x19CE

s_UNUSED_gfx_transition_to_black_19CE:  nop
                                nop
                                nop
                                nop
                                nop
                                nop
                                nop
                                nop
                                nop
                                nop
                                nop
                                nop
                                retn


; 555 bytes
section .unused start=0x5a4f
 
s_UNUSED_debug_5B5A:                 nop
                                nop
                                nop
                                nop
                                nop
                                nop
                                nop
                                nop
                                nop
                                nop
                                nop
                                nop
                                retn


; 133 bytes
section .unused2 start=0x972c
 
s_UNUSED_debug_input_972C:               nop
                                nop
                                nop
                                nop
                                nop
                                nop
                                nop
                                nop
                                nop
                                nop
                                nop
                                nop
                                retn
