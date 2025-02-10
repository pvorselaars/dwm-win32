# dwm-win32 - dynamic window manager for win32
# See LICENSE file for copyright and license details.

LDFLAGS = user32.lib shell32.lib gdi32.lib

SRC = dwm-win32.c
EXE = ${SRC:.c=.exe}
OBJ = ${SRC:.c=.obj}

${EXE}: ${OBJ}
	cl ${OBJ} ${LDFLAGS} /link

%.obj: %.c
	cl /c $<

config.h:
	cp config.def.h $@

clean:
	rm -f ${EXE} ${OBJ}

.PHONY: clean
