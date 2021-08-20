#
# Copyright (c) 2014-present, The osquery authors
#
# This source code is licensed as defined by the LICENSE file found in the
# root directory of this source tree.
#
# SPDX-License-Identifier: (Apache-2.0 OR GPL-2.0-only)
#

set(BASEQUERY_PACKAGE_RELEASE "1.macos")
set(CPACK_PACKAGE_FILE_NAME "${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION}_${BASEQUERY_PACKAGE_RELEASE}_${CMAKE_SYSTEM_PROCESSOR}")
set(CPACK_SET_DESTDIR ON)

install(
  DIRECTORY
    "${BASEQUERY_DATA_PATH}/opt/basequery/basequery.app"

  DESTINATION
    "/opt/basequery/lib"

  USE_SOURCE_PERMISSIONS

  COMPONENT
    basequery
)

execute_process(
  COMMAND "${CMAKE_COMMAND}" -E create_symlink "/opt/basequery/lib/basequery.app/Contents/MacOS/basequeryd" basequeryi
  WORKING_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}"
)

execute_process(
  COMMAND "${CMAKE_COMMAND}" -E create_symlink "/opt/basequery/lib/basequery.app/Contents/Resources/basequeryctl" basequeryctl
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
  DIRECTORY "${BASEQUERY_DATA_PATH}/private/var/basequery"
  DESTINATION "/private/var"
  COMPONENT basequery
)

install(
  DIRECTORY
  DESTINATION "/private/var/log/basequery"
  COMPONENT basequery
)
