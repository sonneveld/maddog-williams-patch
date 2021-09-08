#!/usr/bin/env python3

import hashlib

DEBUG_PATCH=False

EXE_OFFSET = 0x200

def patch(exebin, patchbin, offset, patchlen):
    # sanity check
    assert len(patchbin) == offset+patchlen or patchbin[offset+patchlen] == 0
    exebin[EXE_OFFSET + offset : EXE_OFFSET + offset + patchlen]  = patchbin[offset: offset+patchlen]

def patch_nops(exebin, offset, patchlen):
    nops = bytearray( [0x90] * patchlen )
    exebin[EXE_OFFSET + offset : EXE_OFFSET + offset + patchlen] = nops

def patch_bytes(exebin, offset, b):
    exebin[EXE_OFFSET + offset : EXE_OFFSET + offset + len(b)] = b


def main():
        
    with open('MDWVGA.EXE', 'rb') as f:
        exebin = f.read()
    exebin = bytearray(exebin)
    h = hashlib.sha256()
    with open('MDWVGA.EXE', 'rb') as f:
        h.update(exebin)
    # print(f"mdwvga.exe sha256: {h.hexdigest()}")
    assert h.hexdigest() == '199bf4600096ceb0ef96cc21b504832dc61792d2235125aea2c6d4a5a77282d0'

    # fix mt32 stopping
    with open('patch_roland', 'rb') as f:
        patchbin = f.read()
    patch(exebin, patchbin, 0x2CE3, 0x20)

    # fix loading saves modified by op 21
    with open('patch_op21', 'rb') as f:
        patchbin = f.read()
    patch(exebin, patchbin, 0x50B0, 0x29)

    # fix copying maddog object by op 121
    with open('patch_op121', 'rb') as f:
        patchbin = f.read()
    patch(exebin, patchbin, 0x15d1, 0x37)

    # fix loading of armour sprites between saves
    with open('patch_maincharspr', 'rb') as f:
        patchbin = f.read()
    patch(exebin, patchbin, 0x4423, 3)
    patch(exebin, patchbin, 0x4a67, 3)
    patch(exebin, patchbin, 0x5a49, 9)


    # These ones are useful for debugging, not for general use!

    if DEBUG_PATCH:
        # disable intro text
        patch_nops(exebin, 0x46fa, 11)

        # force room 0100
        room = bytearray([0x30, 0x30, 0x31, 0x30])
        patch_bytes(exebin, 0xD918, room)
        patch_bytes(exebin, 0xD923, room)
        patch_bytes(exebin, 0xD92E, room)
        patch_bytes(exebin, 0xD939, room)


    outname = 'MDWFIX1.EXE'
    if DEBUG_PATCH:
        outname = 'MDWDBG.EXE'

    with open(outname, 'wb') as f:
        f.write(exebin)

if __name__ == "__main__":
    main()