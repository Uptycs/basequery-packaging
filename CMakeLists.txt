#
# Copyright (c) 2014-present, The osquery authors
#
# This source code is licensed as defined by the LICENSE file found in the
# root directory of this source tree.
#
# SPDX-License-Identifier: (Apache-2.0 OR GPL-2.0-only)
#

project("basequery")
cmake_minimum_required(VERSION 3.17.5)

set(BASEQUERY_DATA_PATH "" CACHE PATH "basequery package data")
set(CPACK_PACKAGE_VERSION "" CACHE PATH "basequery package version")

if(BASEQUERY_DATA_PATH STREQUAL "")
  message(FATAL_ERROR "Missing data folder")
endif()

if(NOT CPACK_GENERATOR)
  message(FATAL_ERROR "The CPACK_GENERATOR variable was not set")
endif()

if(BASEQUERY_PACKAGE_VERSION STREQUAL "")
  message(FATAL_ERROR "The BASEQUERY_PACKAGE_VERSION variable was not set")
endif()
set(CPACK_PACKAGE_VERSION "${BASEQUERY_PACKAGE_VERSION}")

set(CPACK_PACKAGE_DESCRIPTION "basequery is an trimmed down version of Osquery.")
set(CPACK_COMPONENT_BASEQUERY_DESCRIPTION "${CPACK_PACKAGE_DESCRIPTION}")
set(CPACK_PACKAGE_NAME "basequery")
set(CPACK_PACKAGE_VENDOR "Uptycs")
set(CPACK_PACKAGE_CONTACT "support@uptycs.com")
set(CPACK_PACKAGE_HOMEPAGE_URL "https://www.uptycs.com")

string(TOLOWER "${CMAKE_SYSTEM_NAME}" platform_name)
if(platform_name STREQUAL "darwin")
  set(platform_name "macos")
endif()

include("platform/common.cmake")
include("platform/${platform_name}/common.cmake")

string(TOLOWER "${CPACK_GENERATOR}" generator_name)
include("platform/${platform_name}/${generator_name}.cmake")

include(CPack)

cpack_add_component("basequery"
  DISPLAY_NAME "Main binaries and tools"
  REQUIRED
)
