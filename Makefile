
MDWFIX1.EXE: patchbins patch_mdwvga.py
	python3 patch_mdwvga.py

patch_roland:
	nasm -f bin -Wall patch_roland.asm

patch_op21:
	nasm -f bin -Wall patch_op21.asm
	
patch_op121:
	nasm -f bin -Wall patch_op121.asm
	
patch_maincharspr:
	nasm -f bin -Wall patch_maincharspr.asm

patchbins: patch_roland patch_op21 patch_op121 patch_maincharspr

clean:
	rm -fv patch_roland patch_op21 patch_op121 patch_maincharspr MDWFIX1.EXE
