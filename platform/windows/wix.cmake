#
# Copyright (c) 2014-present, The basequery authors
#
# This source code is licensed as defined by the LICENSE file found in the
# root directory of this source tree.
#
# SPDX-License-Identifier: (Apache-2.0 OR GPL-2.0-only)
#

if(BASEQUERY_BITNESS STREQUAL "32")
  set(CPACK_WIX_SIZEOF_VOID_P "4")

elseif(BASEQUERY_BITNESS STREQUAL "64")
  set(CPACK_WIX_SIZEOF_VOID_P "8")

else()
  message(FATAL_ERROR "The BASEQUERY_BITNESS variable must be set to either 32 or 64 according to the build type")
endif()

set(CPACK_WIX_PRODUCT_ICON "${BASEQUERY_DATA_PATH}/control/basequery.ico")
set(CPACK_WIX_UPGRADE_GUID "fa6c7327-461e-4033-847c-acdf2b85dede")
set(CPACK_WIX_PATCH_FILE "${BASEQUERY_DATA_PATH}/control/msi/basequery_wix_patch.xml")
set(CPACK_PACKAGE_INSTALL_DIRECTORY "basequery")
set(CPACK_WIX_EXTENSIONS "WixUtilExtension")
