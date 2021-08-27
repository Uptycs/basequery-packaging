#
# Copyright (c) 2014-present, The osquery authors
#
# This source code is licensed as defined by the LICENSE file found in the
# root directory of this source tree.
#
# SPDX-License-Identifier: (Apache-2.0 OR GPL-2.0-only)
#

set(BASEQUERY_PACKAGE_RELEASE "1.linux")
set(CPACK_PACKAGE_FILE_NAME "${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION}_${BASEQUERY_PACKAGE_RELEASE}_${CMAKE_SYSTEM_PROCESSOR}")

set(BASEQUERY_SOURCE_DIRECTORY_LIST "" CACHE PATH "basequery source and build folders")

if(NOT "${BASEQUERY_SOURCE_DIRECTORY_LIST}" STREQUAL "")
  set(CPACK_BUILD_SOURCE_DIRS "${BASEQUERY_SOURCE_DIRECTORY_LIST}")

  message(STATUS "BASEQUERY_SOURCE_DIRECTORY_LIST was set, enabling debug packages")
else()
  message(STATUS "BASEQUERY_SOURCE_DIRECTORY_LIST was not set, disabling debug packages")
endif()

if(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
  set(CMAKE_INSTALL_PREFIX "/opt/basequery" CACHE PATH "" FORCE)
endif()

if(NOT CPACK_PACKAGING_INSTALL_PREFIX)
  set(CPACK_PACKAGING_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")
endif()


install(
  FILES
    "${BASEQUERY_DATA_PATH}/opt/basequery/bin/basequeryd"
    "${BASEQUERY_DATA_PATH}/opt/basequery/bin/basequeryctl"
  
  DESTINATION
    "bin"

  COMPONENT
    basequery

  PERMISSIONS
    OWNER_READ OWNER_WRITE OWNER_EXECUTE
    GROUP_READ             GROUP_EXECUTE
    WORLD_READ             WORLD_EXECUTE 
)

execute_process(
  COMMAND "${CMAKE_COMMAND}" -E create_symlink "/opt/basequery/bin/basequeryd" basequeryi
  WORKING_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}"
)

execute_process(
  COMMAND "${CMAKE_COMMAND}" -E create_symlink "/opt/basequery/bin/basequeryctl" basequeryctl
  WORKING_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}"
)

install(
  FILES
    "${CMAKE_CURRENT_BINARY_DIR}/basequeryi"
    "${CMAKE_CURRENT_BINARY_DIR}/basequeryctl"
  
  DESTINATION
    "/usr/local/bin/"
  
  COMPONENT
    basequery
)

install(
  DIRECTORY "${BASEQUERY_DATA_PATH}/opt/basequery/share/basequery"
  DESTINATION "share"
  COMPONENT basequery
)

install(
  DIRECTORY
  DESTINATION "/etc/basequery"
  COMPONENT basequery
)

install(
  DIRECTORY
  DESTINATION "/var/basequery"
  COMPONENT basequery
)

install(
  DIRECTORY
  DESTINATION "/var/log/basequery"
  COMPONENT basequery
)
