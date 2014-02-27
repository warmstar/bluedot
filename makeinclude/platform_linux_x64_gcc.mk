################################################################################
#	platform_linux_x64_gcc.mk
################################################################################
################################################################################
#
# CC          C compiler command
# CPP         C preprocessor
# CFLAGS      C compiler flags
#
# CXX         C++ compiler command
# CXXCPP      C++ preprocessor
# CXXFLAGS    C++ compiler flags
#
# CPPFLAGS    C/C++ preprocessor flags, e.g. -I<include dir> if you have
#			  headers in a nonstandard directory <include dir>
# LDFLAGS     linker flags, e.g. -L<lib dir> if you have libraries in a
#			  nonstandard directory <lib dir>
#
################################################################################
OS					= linux_x64

CC					= gcc
CPP					= gcc
CXX					= g++
CXXCPP				= g++
AR					= ar
LD					= gcc

EXTENSION_STATIC	= a
EXTENSION_SHARED	= so
EXTENSION_BINARY	= ex

CPPFLAGS			+= \
					  -m64														\
					  -Wall -Wconversion -Wpointer-arith -Wcast-align			\
					  -D_LINUX

CFLAGS				= \
					  $(CPPFLAGS)												\

CXXFLAGS			= \
					  $(CPPFLAGS)												\
					  -Woverloaded-virtual -Wsynth -Wno-ctor-dtor-privacy		\
					  -Wno-non-virtual-dtor										\
					  -fno-rtti -fno-common -fno-exceptions -fshort-wchar		\
					  -D_REENTRANT												\

ARFLAGS				= \
					  cru														\

LDFLAGS				= \
					  -m64														\
					  -Wl,-Bsymbolic											\

CFLAGS_STATIC		= \
					  $(CFLAGS)													\
					  -fPIC														\

CFLAGS_SHARED		= \
					  $(CFLAGS)													\
					  -fPIC														\

CFLAGS_BINARY		= \
					  $(CFLAGS)													\

LDFLAGS_SHARED		= \
					  $(LDFLAGS)												\
					  -shared													\
					  -rdynamic													\

LDFLAGS_BINARY		= \
					  $(LDFLAGS)												\

BIT					= 64

FLAG_PTHREAD		= -lpthread
FLAG_LINKSTATIC		= -Wl,-Bstatic
FLAG_LINKSHARED		= -Wl,-Bdynamic
FLAG_DL             = -ldl

INC_ARCHIVE_START	= -Wl,--whole-archive
INC_ARCHIVE_END		= -Wl,--no-whole-archive

SO_LOADER_NAME		= LD_LIBRARY_PATH
