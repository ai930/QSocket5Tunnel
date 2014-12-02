QT      -= gui
TARGET   = eventdispatcher_libev
TEMPLATE = lib
DESTDIR  = ../lib
CONFIG  += staticlib create_prl release
HEADERS += eventdispatcher_libev.h eventdispatcher_libev_p.h
SOURCES += eventdispatcher_libev.cpp eventdispatcher_libev_p.cpp timers_p.cpp socknot_p.cpp

headers.files = eventdispatcher_libev.h

win32 {
	HEADERS += win32_utils.h
	SOURCES += win32_utils.cpp
}

unix {
	CONFIG += create_pc

	system('pkg-config --exists libev') {
		CONFIG    += link_pkgconfig
		PKGCONFIG += libev
	}
	else {
		LIBS += -lev
	}

	target.path   = /usr/lib
	headers.path  = /usr/include

	QMAKE_PKGCONFIG_NAME        = eventdispatcher_libev
	QMAKE_PKGCONFIG_DESCRIPTION = "LibEv-based event dispatcher for Qt"
	QMAKE_PKGCONFIG_LIBDIR      = $$target.path
	QMAKE_PKGCONFIG_INCDIR      = $$headers.path
	QMAKE_PKGCONFIG_DESTDIR     = pkgconfig
}
else {
	LIBS        += -lev
	headers.path = $$DESTDIR
}

INSTALLS += target headers
