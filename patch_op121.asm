org   0x0000

BITS 16
CPU 286


section .op121_part start=0x15d1

; segcode:15D0  xx 83 C6 34 83 C7 34 B9  02 00 F3 A5 83 C6 18 83
; segcode:15E0  C7 18 B9 08 00 F3 A5 83  C6 20 83 C7 20 B9 04 00
; segcode:15F0  F3 A5 83 C6 06 83 C7 06  B9 02 00 F3 A5 83 C6 34
; segcode:1600  83 C7 34 B9 18 00 F3 A5

;; the offsets were slightly wrong for the later move sections
;; fixes corruption.. but saving during this bit is still not restorable

; original
                ;  add     si, 34h ; '4'
                ;  add     di, 34h ; '4'
                ;  mov     cx, 2
                 ; field_34
                ;  rep movsw
                ;  add     si, 18h
                ;  add     di, 18h
                ;  mov     cx, 8
                 ; field_50
                ;  rep movsw
                ;  add     si, 20h ; ' '
                ;  add     di, 20h ; ' '
                ;  mov     cx, 4
                 ; field_80
                ;  rep movsw
                ;  add     si, 6
                ;  add     di, 6
                ;  mov     cx, 2
                 ; field_8E
                ;  rep movsw
                ;  add     si, 34h ; '4'
                ;  add     di, 34h ; '4'
                ;  mov     cx, 18h
                 ; field_C6
                ;  rep movsw

                 add     si, 34h
                 add     di, 34h
                 mov     cx, 2
                 ; field_34
                 rep movsw      ; si/di += 4
                 add     si, 18h
                 add     di, 18h
                 mov     cx, 8
                 ; field_50
                 rep movsw      ; si/di += 0x10
                 add     si, 1Eh ; ' '
                 add     di, 1Eh ; ' '
                 mov     cx, 4
                 ; field_7E
                 rep movsw      ; si/di += 8
                 add     si, 4
                 add     di, 4
                 mov     cx, 2
                 ; field_8A
                 rep movsw      ; si/di += 4
                 add     si, 32h
                 add     di, 32h
                 mov     cx, 18h
                 ; field_C0
                 rep movsw      ; si/di += 0x30
