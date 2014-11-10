#-------------------------------------------------
#
# Project created by QtCreator 2014-11-07T20:30:48
#
#-------------------------------------------------

QT       += core gui network

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = Client
TEMPLATE = app

DEFINES += USE_ENCRYPT #若要启用加密，就取消此宏注释

CONFIG += C++11

SOURCES += main.cpp\
        mainwindow.cpp \
    ../common/datastruct.cpp \
    tcpserver.cpp \
    ../common/opensslaes.cpp


HEADERS  += mainwindow.h \
    ../common/datastruct.h \
    tcpserver.h \
    localsocket.h \
    ../common/opensslaes.h


FORMS    += mainwindow.ui



win32: LIBS += -LC:/OpenSSL-Win32/lib/MinGW/ -leay32

INCLUDEPATH += C:/OpenSSL-Win32/include
DEPENDPATH += C:/OpenSSL-Win32/include

win32:!win32-g++: PRE_TARGETDEPS += C:/OpenSSL-Win32/lib/MinGW/eay32.lib
else:win32-g++: PRE_TARGETDEPS += C:/OpenSSL-Win32/lib/MinGW/libeay32.a
