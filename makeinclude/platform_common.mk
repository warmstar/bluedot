################################################################################
# set system name and machine architecture info
################################################################################
SYSNAME		= $(shell uname -s)
MACHINE		= $(shell uname -m)
ERRMSG_1	= Target platform is not defined.	\
			  Supported platform is Linux(32bit/64bit).
ERRMSG_2	= $(BD_PLATFORM) is unsupported.

ifndef BD_PLATFORM

ifeq ($(SYSNAME), Linux)
ifeq ($(MACHINE), x86_64)
ifeq ($(VER), 32)
VER				= 32
BD_PLATFORM	= LINUX32_GCC
else
VER				= 64
BD_PLATFORM	= LINUX64_GCC
endif # end VER
else
VER				= 32
BD_PLATFORM	= LINUX32_GCC
endif # end MACHINE
endif # end SYSNAME

endif # end BD_PLATFORM

ifdef pub
	OPTIMIZE_FLAGS = -g -O2
else
	OPTIMIZE_FLAGS = -g -D_BD_DEBUG
endif

CPPFLAGS = $(OPTIMIZE_FLAGS)

################################################################################
# check BD_PLATFORM
################################################################################
ifndef BD_PLATFORM
$(error $(ERRMSG_1))
endif

################################################################################
# check BD_PLATFORM_RESULT
################################################################################
BD_PLATFORM_RESULT	= $(filter LINUX64_GCC					\
					  		   LINUX32_GCC					\
							   , $(BD_PLATFORM))
ifeq (, $(BD_PLATFORM_RESULT))
$(error $(ERRMSG_2))
endif

################################################################################
# include compiler info
################################################################################
ifeq ($(BD_PLATFORM), LINUX32_GCC)
include $(BD_ROOT)/makeinclude/platform_linux_x86_gcc.mk
endif

ifeq ($(BD_PLATFORM), LINUX64_GCC)
include $(BD_ROOT)/makeinclude/platform_linux_x64_gcc.mk
endif
