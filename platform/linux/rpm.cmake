#
# Copyright (c) 2014-present, The osquery authors
#
# This source code is licensed as defined by the LICENSE file found in the
# root directory of this source tree.
#
# SPDX-License-Identifier: (Apache-2.0 OR GPL-2.0-only)
#

set(CPACK_STRIP_FILES ON)
set(CPACK_RPM_PACKAGE_RELEASE "${BASEQUERY_PACKAGE_RELEASE}")
set(CPACK_RPM_FILE_NAME "RPM-DEFAULT")
set(CPACK_RPM_PACKAGE_DESCRIPTION "${CPACK_PACKAGE_DESCRIPTION}")
set(CPACK_RPM_PACKAGE_GROUP "default")
set(CPACK_RPM_PACKAGE_LICENSE "Apache 2.0 or GPL 2.0")
set(CPACK_RPM_PACKAGE_REQUIRES "glibc >= 2.12, zlib")
set(CPACK_RPM_POST_INSTALL_SCRIPT_FILE "${BASEQUERY_DATA_PATH}/control/postinst")

if(DEFINED BASEQUERY_SOURCE_DIRECTORY_LIST)
  set(CPACK_RPM_DEBUGINFO_PACKAGE ON)
  set(CPACK_RPM_BUILD_SOURCE_DIRS_PREFIX "/usr/src/debug/basequery")
  set(CPACK_RPM_DEBUGINFO_FILE_NAME "RPM-DEFAULT")
endif()

list(APPEND CPACK_RPM_EXCLUDE_FROM_AUTO_FILELIST_ADDITION
  /etc/sysconfig
  /var
  /var/log
  /usr/lib/systemd
  /usr/lib/systemd/system
)

install(
  FILES "${BASEQUERY_DATA_PATH}/control/rpm/etc/init.d/basequeryd"
  DESTINATION "/etc/init.d"
  COMPONENT basequery

  PERMISSIONS
    OWNER_READ OWNER_WRITE OWNER_EXECUTE
    GROUP_READ             GROUP_EXECUTE
    WORLD_READ             WORLD_EXECUTE
)

install(
  FILES "${BASEQUERY_DATA_PATH}/control/rpm/lib/systemd/system/basequeryd.service"
  DESTINATION "lib/systemd/system"
  COMPONENT basequery
)

install(
  FILES "${BASEQUERY_DATA_PATH}/control/rpm/etc/sysconfig/basequeryd"
  DESTINATION "/etc/sysconfig"
  COMPONENT basequery
)
