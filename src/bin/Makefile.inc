.include <own.mk>

BINOWN=	dragon
BINGRP=	dragon
BINDIR?=	${HOME}/bin
WARNS=	6

.SUFFIXES: .sed

.sed:
	rm -f ${.TARGET}
	cp ${.IMPSRC} ${.TARGET}
