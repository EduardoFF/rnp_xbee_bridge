# Install script for directory: /home/idsia/Repositories/rnp_xbee_bridge/src

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "/usr/local")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

# Install shared libraries without execute permission?
IF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  SET(CMAKE_INSTALL_SO_NO_EXE "1")
ENDIF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)

IF(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  INCLUDE("/home/idsia/Repositories/rnp_xbee_bridge/build-src-Desktop-Default/routing_driver/cmake_install.cmake")
  INCLUDE("/home/idsia/Repositories/rnp_xbee_bridge/build-src-Desktop-Default/gps_driver/cmake_install.cmake")
  INCLUDE("/home/idsia/Repositories/rnp_xbee_bridge/build-src-Desktop-Default/xbee_interface/cmake_install.cmake")
  INCLUDE("/home/idsia/Repositories/rnp_xbee_bridge/build-src-Desktop-Default/xbee_app_data/cmake_install.cmake")
  INCLUDE("/home/idsia/Repositories/rnp_xbee_bridge/build-src-Desktop-Default/timer/cmake_install.cmake")
  INCLUDE("/home/idsia/Repositories/rnp_xbee_bridge/build-src-Desktop-Default/end_node/cmake_install.cmake")
  INCLUDE("/home/idsia/Repositories/rnp_xbee_bridge/build-src-Desktop-Default/ctrl_node/cmake_install.cmake")

ENDIF(NOT CMAKE_INSTALL_LOCAL_ONLY)

IF(CMAKE_INSTALL_COMPONENT)
  SET(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
ELSE(CMAKE_INSTALL_COMPONENT)
  SET(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
ENDIF(CMAKE_INSTALL_COMPONENT)

FILE(WRITE "/home/idsia/Repositories/rnp_xbee_bridge/build-src-Desktop-Default/${CMAKE_INSTALL_MANIFEST}" "")
FOREACH(file ${CMAKE_INSTALL_MANIFEST_FILES})
  FILE(APPEND "/home/idsia/Repositories/rnp_xbee_bridge/build-src-Desktop-Default/${CMAKE_INSTALL_MANIFEST}" "${file}\n")
ENDFOREACH(file)
