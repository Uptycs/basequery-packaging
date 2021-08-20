#
# Copyright (c) 2014-present, The osquery authors
#
# This source code is licensed as defined by the LICENSE file found in the
# root directory of this source tree.
#
# SPDX-License-Identifier: (Apache-2.0 OR GPL-2.0-only)
#

install(
  DIRECTORY "${BASEQUERY_DATA_PATH}/control/nupkg/tools"
  DESTINATION "."
  COMPONENT basequery
)

install(
  FILES "${BASEQUERY_DATA_PATH}/control/basequery.png"
  DESTINATION "."
  COMPONENT basequery
)

install(
  FILES "${BASEQUERY_DATA_PATH}/control/LICENSE.txt"
  DESTINATION "."
  COMPONENT basequery
)

set(CPACK_NUGET_PACKAGE_DESCRIPTION "
  basequery is a trimmed down version of Osquery.
  
  ### Package Parameters
    * `/InstallService` - This creates a new windows service that will 
                          auto-start the daemon.
                          
  These parameters can be passed to the installer with the use of 
  `--params`. For example: `--params='/InstallService'`.
  "
)
set(BASEQUERY_REPO "https://github.com/basequery/basequery/")
set(CPACK_NUGET_PACKAGE_AUTHORS "${CPACK_PACKAGE_NAME}")
set(CPACK_NUGET_PACKAGE_TITLE "${CPACK_PACKAGE_NAME}")
set(CPACK_NUGET_PACKAGE_OWNERS "${CPACK_PACKAGE_NAME}")
set(CPACK_NUGET_PACKAGE_COPYRIGHT "Copyright (c) 2014-present, The basequery authors. See LICENSE.")
set(CPACK_NUGET_PACKAGE_LICENSEURL "https://raw.githubusercontent.com/basequery/basequery/master/LICENSE")
set(CPACK_NUGET_PACKAGE_ICON "basequery.png")
set(CPACK_NUGET_PACKAGE_DESCRIPTION_SUMMARY "
  basequery gives you the ability to query and log things like running 
  processes, logged in users, password changes, usb devices, firewall 
  exceptions, listening ports, and more.
  "
)
set(CPACK_NUGET_PACKAGE_RELEASE_NOTES "${BASEQUERY_REPO}releases/tag/${CPACK_PACKAGE_VERSION}")
set(CPACK_NUGET_PACKAGE_TAGS "infosec tools security")
