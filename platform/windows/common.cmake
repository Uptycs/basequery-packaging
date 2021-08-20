#
# Copyright (c) 2014-present, The osquery authors
#
# This source code is licensed as defined by the LICENSE file found in the
# root directory of this source tree.
#
# SPDX-License-Identifier: (Apache-2.0 OR GPL-2.0-only)
#

set(CPACK_PACKAGE_FILE_NAME "${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION}")
set(BASEQUERY_BITNESS "" CACHE STRING "basequery build bitness (32 or 64)")

if ("${BASEQUERY_BITNESS}" STREQUAL "32")
  set(PROGRAM_FILES_DIR "Program Files (x86)")
else()
  set(PROGRAM_FILES_DIR "Program Files")
endif()

set(directory_name_list
  "certs"
  "log"
)

set(file_name_list
  "manage-basequeryd.ps1"
  "basequery.conf"
  "basequery.flags"
  "basequery.man"
  "basequery_utils.ps1"
  "basequeryi.exe"
)

foreach(directory_name ${directory_name_list})
  install(
    DIRECTORY "${BASEQUERY_DATA_PATH}/${PROGRAM_FILES_DIR}/basequery/${directory_name}"
    DESTINATION "."
    COMPONENT basequery
  )
endforeach()

foreach(file_name ${file_name_list})
  install(
    FILES "${BASEQUERY_DATA_PATH}/${PROGRAM_FILES_DIR}/basequery/${file_name}"
    DESTINATION "."
    COMPONENT basequery
  )
endforeach()

install(
  FILES "${BASEQUERY_DATA_PATH}/${PROGRAM_FILES_DIR}/basequery/basequeryd/basequeryd.exe"
  DESTINATION "basequeryd"
  COMPONENT basequery
)
