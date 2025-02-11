# dwm-win32 - dynamic window manager for win32
# See LICENSE file for copyright and license details.

CC      = cl
CFLAGS  = /c
LDFLAGS = user32.lib shell32.lib gdi32.lib /link

SRC = dwm-win32.c
EXE = ${SRC:.c=.exe}
OBJ = ${SRC:.c=.obj}

${EXE}: ${OBJ}
	${CC} ${OBJ} ${LDFLAGS}

%.obj: %.c
	${CC} ${CFLAGS} $<

debug: CFLAGS += /Zi
debug: LDFLAGS += /debug
debug: ${EXE}

config.h:
	cp config.def.h $@

clean:
	rm -f ${EXE} ${OBJ}

.PHONY: clean debug
