; MASTER.LIB code used in the combined TH01 binary.

		.386
		.model use16 large _TEXT

GAME = 1

include ReC98.inc

DGROUP group SPANISH_TRANSLATION_TEXT

; ===========================================================================

; Segment type:	Pure code
_TEXT		segment	word public 'CODE' use16
		assume cs:_TEXT
		assume es:nothing, ds:DGROUP, fs:nothing, gs:nothing

include libs/master.lib/text_clear.asm
include libs/master.lib/text_fillca.asm
include libs/master.lib/graph_400line.asm
include libs/master.lib/graph_clear.asm
include libs/master.lib/graph_show.asm
include libs/master.lib/graph_start.asm
include libs/master.lib/graph_scrollup.asm
include libs/master.lib/palette_show.asm
include libs/master.lib/palette_init.asm
include libs/master.lib/resdata.asm
include libs/master.lib/dos_filesize.asm
include libs/master.lib/file_read.asm
include libs/master.lib/file_close.asm
include libs/master.lib/file_exist.asm
include libs/master.lib/file_ropen.asm
include libs/master.lib/file_size.asm
include libs/master.lib/file_write.asm
include libs/master.lib/file_create.asm
include libs/master.lib/file_seek.asm
include libs/master.lib/dos_free.asm
include libs/master.lib/dos_axdx.asm
include libs/master.lib/keystart.asm
include libs/master.lib/key_sense.asm
include libs/master.lib/keybios.asm
include libs/master.lib/dos_ropen.asm
include libs/master.lib/grcg_boxfill.asm
include libs/master.lib/grcg_setcolor.asm
include libs/master.lib/dos_puts2.asm
include libs/master.lib/egc.asm
include libs/master.lib/iatan2.asm
include libs/master.lib/isqrt.asm
include libs/master.lib/gdc_outpw.asm
include libs/master.lib/random.asm
_TEXT		ends

	.data

include libs/master.lib/version[data].asm
include libs/master.lib/tx[data].asm
include libs/master.lib/grp[data].asm
include libs/master.lib/pal[data].asm
include libs/master.lib/edges[data].asm
include libs/master.lib/fil[data].asm
include libs/master.lib/keytable[data].asm
include libs/master.lib/keystart[data].asm
include libs/master.lib/keyback[data].asm
include libs/master.lib/dos_ropen[data].asm
include libs/master.lib/clip[data].asm
include libs/master.lib/sin8[data].asm
include libs/master.lib/atan8[data].asm
include libs/master.lib/rand[data].asm

	.data?

include libs/master.lib/pal[bss].asm
include libs/master.lib/fil[bss].asm
include libs/master.lib/keystart[bss].asm


SPANISH_TRANSLATION_TEXT	segment byte public 'BSS' use16
	assume cs:SPANISH_TRANSLATION_TEXT

public FONT_READ_PATCHED
; Get the de-mangled C++ name by tdump -m 
extern @FONT_READ$QM12FONT_GLYPH_TUI:proc  ; unused, I end up rewriting it

FONT_READ_PATCHED proc far
				push    bp
				mov     bp, sp
        mov     bx, word ptr [bp + 0Ah]
        mov     cx, word ptr [bp + 08h]
        mov     dx, word ptr [bp + 06h]
        mov     ah, 14h 
        int     21h
        les     bx, [bp + 08h]
        mov     al, byte ptr es:[bx + 01h]
        shl     al, 03h
        mov     byte ptr es:[bx + 01h], al
        mov     al, byte ptr es:[bx]
        shl     al, 03h
        mov     byte ptr es:[bx], al
        pop     bp
        retf    06h
FONT_READ_PATCHED endp 

SPANISH_TRANSLATION_TEXT	ends
	end
