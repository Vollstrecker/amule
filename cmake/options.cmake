#
# This file is part of the aMule Project.
#
# Copyright (c) 2011 Werner Mahr (Vollstrecker) <amule@vollstreckernet.de>
#
# Any parts of this program contributed by third-party developers are copyrighted
# by their respective authors.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301, USA
#
# This file contains the options for en- or disabling parts of aMule, and
# sets the needed variables for them to compile
#

OPTION (BUILD_ALC "compile aLinkCreator GUI version")
OPTION (BUILD_ALCC "compile aLinkCreator for console")
OPTION (BUILD_AMULECMD "compile aMule command line client")

IF (UNIX)
	OPTION (BUILD_CAS "compile C aMule Statistics")
ENDIF (UNIX)

OPTION (BUILD_DAEMON "compile aMule daemon version")
OPTION (BUILD_ED2K "compile aMule ed2k links handler" ON)
OPTION (BUILD_EVERYTHING "compile all parts of aMule")
OPTION (BUILD_FILEVIEW "compile aMule file viewer for console (EXPERIMENTAL)")
OPTION (BUILD_MONOLITHIC "enable building of the monolithic aMule app" ON)

IF (UNIX)
	OPTION (BUILD_PLASMAMULE "compile aMule plasma applet and engine")
ENDIF (UNIX)

OPTION (BUILD_REMOTEGUI "compile aMule remote GUI")
OPTION (BUILD_WEBSERVER "compile aMule WebServer")
OPTION (BUILD_WXCAS "compile aMule GUI Statistics")
OPTION (BUILD_XAS "install xas XChat2 plugin")
OPTION (BUILD_TESTING "Run Tests after compile" ON)

OPTION (DOWNLOAD_AND_BUILD_DEPS "Get all missing stuff" OFF)

IF (PREFIX)
	SET (CMAKE_INSTALL_PREFIX "${PREFIX}")
ENDIF (PREFIX)

INCLUDE (GNUInstallDirs)

SET (PKGDATADIR "${CMAKE_INSTALL_DATADIR}/${PACKAGE}")

IF (BUILD_EVERYTHING)
	SET (BUILD_ALC ON CACHE BOOL "compile aLinkCreator GUI version" FORCE)
	SET (BUILD_ALCC ON CACHE BOOL "compile aLinkCreator for console" FORCE)
	SET (BUILD_AMULECMD ON CACHE BOOL "compile aMule command line client" FORCE)

	IF (UNIX)
		SET (BUILD_CAS ON CACHE BOOL "compile C aMule Statistics" FORCE)
	ENDIF (UNIX)

	SET (BUILD_DAEMON ON CACHE BOOL "compile aMule daemon version" FORCE)
	SET (BUILD_FILEVIEW ON CACHE BOOL "compile aMule file viewer for console (EXPERIMENTAL)" FORCE)

#	IF (UNIX)
#		SET (BUILD_PLASMAMULE ON CACHE BOOL )
#	ENDIF (UNIX)

	SET (BUILD_REMOTEGUI ON CACHE BOOL "compile aMule remote GUI" FORCE)
	SET (BUILD_WEBSERVER ON CACHE BOOL "compile aMule WebServer" FORCE)
	SET (BUILD_WXCAS ON CACHE BOOL "compile aMule GUI Statistics" FORCE)
	SET (BUILD_XAS ON CACHE BOOL "install xas XChat2 plugin" FORCE)
ENDIF (BUILD_EVERYTHING)

IF (BUILD_AMULECMD)
	SET (NEED_LIB_EC TRUE)
	SET (NEED_LIB_MULECOMMON TRUE)
	SET (NEED_LIB_MULESOCKET TRUE)
	SET (wx_NEED_NET TRUE)
	SET (NEED_ZLIB TRUE)
ENDIF (BUILD_AMULECMD)

IF (BUILD_CAS)
	SET (BUILD_UTIL TRUE)
ENDIF (BUILD_CAS)

IF (BUILD_ALCC)
	SET (BUILD_UTIL TRUE)
	SET (wx_NEED_BASE TRUE)
ENDIF (BUILD_ALCC)

IF (BUILD_ALC)
	SET (BUILD_UTIL TRUE)
	SET (wx_NEED_GUI TRUE)
ENDIF (BUILD_ALC)

IF (BUILD_XAS)
	SET (BUILD_UTIL TRUE)
ENDIF (BUILD_XAS)

IF (BUILD_DAEMON)
	SET (NEED_LIB_EC TRUE)
	SET (NEED_LIB_MULEAPPCOMMON TRUE)
	SET (NEED_LIB_MULECOMMON TRUE)
	SET (NEED_LIB_MULESOCKET TRUE)
	SET (NEED_ZLIB TRUE)
	SET (wx_NEED_NET TRUE)
ENDIF (BUILD_DAEMON)

IF (BUILD_ED2K)
	SET (wx_NEED_BASE TRUE)
ENDIF (BUILD_ED2K)

IF (BUILD_FILEVIEW)
	SET (BUILD_UTIL TRUE)
	SET (NEED_LIB_CRYPTO TRUE)
	SET (NEED_LIB_MULECOMMON TRUE)
	SET (wx_NEED_NET TRUE)
ENDIF (BUILD_FILEVIEW)

IF (BUILD_MONOLITHIC)
	SET (NEED_LIB_EC TRUE)
	SET (NEED_LIB_MULEAPPGUI TRUE)
	SET (NEED_LIB_MULEAPPCOMMON TRUE)
	SET (NEED_LIB_MULECOMMON TRUE)
	SET (NEED_LIB_MULESOCKET TRUE)
	SET (NEED_ZLIB TRUE)
	SET (wx_NEED_ADV TRUE)
	SET (wx_NEED_NET TRUE)
ENDIF (BUILD_MONOLITHIC)

IF (BUILD_MONOLITHIC OR BUILD_REMOTEGUI)
	SET (INSTALL_SKINS TRUE)
ENDIF (BUILD_MONOLITHIC OR BUILD_REMOTEGUI)

IF (BUILD_PLASMAMULE)
	SET (BUILD_UTIL TRUE)
ENDIF (BUILD_PLASMAMULE)

IF (BUILD_REMOTEGUI)
	SET (NEED_GLIB_CHECK TRUE)
	SET (NEED_LIB_EC TRUE)
	SET (NEED_LIB_MULEAPPCOMMON TRUE)
	SET (NEED_LIB_MULEAPPGUI TRUE)
	SET (NEED_LIB_MULECOMMON TRUE)
	SET (NEED_LIB_MULESOCKET TRUE)
	SET (NEED_ZLIB TRUE)
	SET (wx_NEED_ADV TRUE)
	SET (wx_NEED_NET TRUE)
ENDIF (BUILD_REMOTEGUI)

IF (BUILD_WEBSERVER)
	SET (NEED_LIB_EC TRUE)
	SET (NEED_LIB_MULECOMMON TRUE)
	SET (NEED_LIB_MULESOCKET TRUE)
	SET (NEED_ZLIB TRUE)
	SET (WEBSERVERDIR "${PKGDATADIR}/webserver/")
	SET (wx_NEED_NET TRUE)
ENDIF (BUILD_WEBSERVER)

IF (BUILD_WXCAS)
	SET (BUILD_UTIL TRUE)
	SET (wx_NEED_GUI TRUE)
	SET (wx_NEED_NET TRUE)
ENDIF (BUILD_WXCAS)

IF (NEED_LIB_EC)
	SET (NEED_LIB_CRYPTO TRUE)
ENDIF (NEED_LIB_EC)

IF (NEED_LIB_MULECOMMON OR NEED_LIB_EC)
	SET (NEED_LIB TRUE)
	SET (wx_NEED_BASE TRUE)
ENDIF (NEED_LIB_MULECOMMON OR NEED_LIB_EC)

IF (NEED_LIB_MULECOMMON)
	SET (NEED_GLIB_CHECK TRUE)
ENDIF (NEED_LIB_MULECOMMON)

IF (NEED_LIB_MULEAPPCOMMON)
	OPTION (ENABLE_BOOST "compile with Boost.ASIO Sockets" ON)
	OPTION (ENABLE_IP2COUNTRY "compile with GeoIP IP2Country library")
	OPTION (ENABLE_MMAP "enable using mapped memory if supported")
	OPTION (ENABLE_NLS "enable national language support" ON)
	SET (NEED_LIB_MULEAPPCORE TRUE)
	SET (wx_NEED_BASE TRUE)
ELSE (NEED_LIB_MULEAPPCOMMON)
	SET (ENABLE_BOOST FALSE)
	SET (ENABLE_IP2COUNTRY FALSE)
	SET (ENABLE_MMAP FALSE)
	SET (ENABLE_NLS FALSE)
ENDIF (NEED_LIB_MULEAPPCOMMON)

IF (NEED_LIB_MULEAPPGUI)
	SET (wx_NEED_GUI TRUE)
ENDIF (NEED_LIB_MULEAPPGUI)

IF (NEED_LIB_MULESOCKET)
	SET (wx_NEED_BASE TRUE)
ENDIF (NEED_LIB_MULESOCKET)

IF (ENABLE_BOOST AND NOT (BUILD_DAEMON OR BUILD_MONOLITHIC OR BUILD_REMOTEGUI OR BUILD_WXCAS))
	SET (wx_NEED_NET FALSE)
ENDIF (ENABLE_BOOST AND NOT (BUILD_DAEMON OR BUILD_MONOLITHIC OR BUILD_REMOTEGUI OR BUILD_WXCAS))

IF (wx_NEED_ADV OR wx_NEED_BASE OR wx_NEED_GUI OR wx_NEED_NET)
	SET (wx_NEEDED TRUE)

	IF (WIN32 AND NOT wx_NEED_BASE)
		SET (wx_NEED_BASE TRUE)
	ENDIF (WIN32 AND NOT wx_NEED_BASE)
ENDIF (wx_NEED_ADV OR wx_NEED_BASE OR wx_NEED_GUI OR wx_NEED_NET)

ADD_COMPILE_DEFINITIONS ($<$<CONFIG:DEBUG>:__DEBUG__>)

IF (WIN32)
	ADD_COMPILE_DEFINITIONS ($<$<CONFIG:DEBUG>:wxDEBUG_LEVEL=0)
ENDIF (WIN32)

IF (CMAKE_BUILD_TYPE STREQUAL "Debug" AND wx_NEEDED)
	SET (wxWidgets_USE_DEBUG TRUE)
ELSE (CMAKE_BUILD_TYPE STREQUAL "Debug" AND wx_NEEDED)
	SET (wxWidgets_USE_DEBUG FALSE)
ENDIF (CMAKE_BUILD_TYPE STREQUAL "Debug" AND wx_NEEDED)

IF (NEED_LIB_MULEAPPCOMMON OR BUILD_WEBSERVER)
	OPTION (ENABLE_UPNP "enable UPnP support in aMule" ON)
ENDIF (NEED_LIB_MULEAPPCOMMON OR BUILD_WEBSERVER)
