#
# Copyright (c) 2014-present, The osquery authors
#
# This source code is licensed as defined by the LICENSE file found in the
# root directory of this source tree.
#
# SPDX-License-Identifier: (Apache-2.0 OR GPL-2.0-only)
#

set(CPACK_PACKAGE_FILE_NAME "${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION}")
set(CPACK_COMMAND_PRODUCTBUILD "${BASEQUERY_DATA_PATH}/control/pkg/productbuild.sh")
set(CPACK_COMMAND_PKGBUILD "${CPACK_COMMAND_PRODUCTBUILD}")

install(
  FILES
    "${BASEQUERY_DATA_PATH}/control/pkg/io.basequery.agent.conf"
    "${BASEQUERY_DATA_PATH}/control/pkg/io.basequery.agent.plist"

  DESTINATION
    "/private/var/basequery"

  COMPONENT
    basequery
)
