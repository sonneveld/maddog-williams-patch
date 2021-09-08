# Maddog Williams DOS Patch

This patched version of Maddog Williams fixes a number of issues. 

# Usage

Copy MDWFIX1.EXE into your Maddog Williams installation, run it instead of MDWVGA.EXE
# Fixes

- Modified MIDI stop to send full All Notes off message
- Fix restoring from saves where op21 was used. (test by restoring in certain rooms, like castle library)
- Fix some graphical corruption when using op121 (test by looking under rug in bar)
- Fix issue where restoring games with armour, wouldn't load armour (test by loading a save with armour worn)

# TODO

- Fix timing of wizard and princess blinking
- Enable debug keys, commands
- Maybe fix issue where you can't save _while_ looking at rug
- sign check issue with clip function
- optionally re-add copy protection, for people who want the "authentic" experience :)
