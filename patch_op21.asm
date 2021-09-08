org   0x0000

BITS 16
CPU 286


absolute 0x9824
b_draw_pixel_colour_13E84 resb 1
b_draw_pixel_page_index_13E85 resb 1


absolute 0x9d96
s_gfx_draw_horz_line_9D96:


absolute 0x5043
loc_5043:


section .static_line_load start=0x50B0

;; original
; loc_50B0:                             
;                 inc     si
;                 mov     dx, [si]
;                 mov     [b_draw_pixel_page_index_13E85], dh
;                 mov     dx, [si+2]
;                 mov     [b_draw_pixel_colour_13E84], dh
;                 mov     ax, [si+4]
;                 xchg    ah, al
;                 mov     dx, [si+6]
;                 xchg    dh, dl
;                 mov     bx, [si+8]
;                 xchg    bh, bl
;                 mov     cx, [si+0Ah]
;                 xchg    ch, cl
;                 push    si
;                 push    di
;                 mov     si, bx
;                 mov     di, cx
;                 call    s_gfx_draw_horz_line_9D96 
;                 pop     di
;                 pop     si
;                 add     si, 0Ch

;; original:
; segcode:50B0  46 8B 14 88 36 25 98 8B  54 02 88 36 24 98 8B 44
; segcode:50C0  04 86 E0 8B 54 06 86 F2  8B 5C 08 86 FB 8B 4C 0A
; segcode:50D0  86 E9 56 57 8B F3 8B F9  E8 BB 4C 5F 5E 83 C6 0C
; segcode:50E0  E9 60 FF

loc_50B0:               
                ;; this is awkward but I think op21 is buggy.
                ;; read in same format to preserve existing save games
                ;; offsets were off by 1, and converting from big endian wasn't necessary
                mov     dx, [si+2]
                mov     [b_draw_pixel_page_index_13E85], dl
                mov     dx, [si+4]
                mov     [b_draw_pixel_colour_13E84], dl
                mov     ax, [si+6]
                mov     dx, [si+8]
                mov     bx, [si+0xA]
                mov     cx, [si+0xC]
                pusha
                mov     si, bx
                mov     di, cx
                call    s_gfx_draw_horz_line_9D96 
                popa
                add     si, 0Eh
                jmp     loc_5043
