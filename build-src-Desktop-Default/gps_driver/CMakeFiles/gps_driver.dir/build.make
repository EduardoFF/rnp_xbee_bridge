# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/idsia/Repositories/rnp_xbee_bridge/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/idsia/Repositories/rnp_xbee_bridge/build-src-Desktop-Default

# Include any dependencies generated for this target.
include gps_driver/CMakeFiles/gps_driver.dir/depend.make

# Include the progress variables for this target.
include gps_driver/CMakeFiles/gps_driver.dir/progress.make

# Include the compile flags for this target's objects.
include gps_driver/CMakeFiles/gps_driver.dir/flags.make

gps_driver/CMakeFiles/gps_driver.dir/gps_driver.cc.o: gps_driver/CMakeFiles/gps_driver.dir/flags.make
gps_driver/CMakeFiles/gps_driver.dir/gps_driver.cc.o: /home/idsia/Repositories/rnp_xbee_bridge/src/gps_driver/gps_driver.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/idsia/Repositories/rnp_xbee_bridge/build-src-Desktop-Default/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object gps_driver/CMakeFiles/gps_driver.dir/gps_driver.cc.o"
	cd /home/idsia/Repositories/rnp_xbee_bridge/build-src-Desktop-Default/gps_driver && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/gps_driver.dir/gps_driver.cc.o -c /home/idsia/Repositories/rnp_xbee_bridge/src/gps_driver/gps_driver.cc

gps_driver/CMakeFiles/gps_driver.dir/gps_driver.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/gps_driver.dir/gps_driver.cc.i"
	cd /home/idsia/Repositories/rnp_xbee_bridge/build-src-Desktop-Default/gps_driver && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/idsia/Repositories/rnp_xbee_bridge/src/gps_driver/gps_driver.cc > CMakeFiles/gps_driver.dir/gps_driver.cc.i

gps_driver/CMakeFiles/gps_driver.dir/gps_driver.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/gps_driver.dir/gps_driver.cc.s"
	cd /home/idsia/Repositories/rnp_xbee_bridge/build-src-Desktop-Default/gps_driver && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/idsia/Repositories/rnp_xbee_bridge/src/gps_driver/gps_driver.cc -o CMakeFiles/gps_driver.dir/gps_driver.cc.s

gps_driver/CMakeFiles/gps_driver.dir/gps_driver.cc.o.requires:
.PHONY : gps_driver/CMakeFiles/gps_driver.dir/gps_driver.cc.o.requires

gps_driver/CMakeFiles/gps_driver.dir/gps_driver.cc.o.provides: gps_driver/CMakeFiles/gps_driver.dir/gps_driver.cc.o.requires
	$(MAKE) -f gps_driver/CMakeFiles/gps_driver.dir/build.make gps_driver/CMakeFiles/gps_driver.dir/gps_driver.cc.o.provides.build
.PHONY : gps_driver/CMakeFiles/gps_driver.dir/gps_driver.cc.o.provides

gps_driver/CMakeFiles/gps_driver.dir/gps_driver.cc.o.provides.build: gps_driver/CMakeFiles/gps_driver.dir/gps_driver.cc.o

# Object files for target gps_driver
gps_driver_OBJECTS = \
"CMakeFiles/gps_driver.dir/gps_driver.cc.o"

# External object files for target gps_driver
gps_driver_EXTERNAL_OBJECTS =

gps_driver/libgps_driver.a: gps_driver/CMakeFiles/gps_driver.dir/gps_driver.cc.o
gps_driver/libgps_driver.a: gps_driver/CMakeFiles/gps_driver.dir/build.make
gps_driver/libgps_driver.a: gps_driver/CMakeFiles/gps_driver.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX static library libgps_driver.a"
	cd /home/idsia/Repositories/rnp_xbee_bridge/build-src-Desktop-Default/gps_driver && $(CMAKE_COMMAND) -P CMakeFiles/gps_driver.dir/cmake_clean_target.cmake
	cd /home/idsia/Repositories/rnp_xbee_bridge/build-src-Desktop-Default/gps_driver && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/gps_driver.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
gps_driver/CMakeFiles/gps_driver.dir/build: gps_driver/libgps_driver.a
.PHONY : gps_driver/CMakeFiles/gps_driver.dir/build

gps_driver/CMakeFiles/gps_driver.dir/requires: gps_driver/CMakeFiles/gps_driver.dir/gps_driver.cc.o.requires
.PHONY : gps_driver/CMakeFiles/gps_driver.dir/requires

gps_driver/CMakeFiles/gps_driver.dir/clean:
	cd /home/idsia/Repositories/rnp_xbee_bridge/build-src-Desktop-Default/gps_driver && $(CMAKE_COMMAND) -P CMakeFiles/gps_driver.dir/cmake_clean.cmake
.PHONY : gps_driver/CMakeFiles/gps_driver.dir/clean

gps_driver/CMakeFiles/gps_driver.dir/depend:
	cd /home/idsia/Repositories/rnp_xbee_bridge/build-src-Desktop-Default && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/idsia/Repositories/rnp_xbee_bridge/src /home/idsia/Repositories/rnp_xbee_bridge/src/gps_driver /home/idsia/Repositories/rnp_xbee_bridge/build-src-Desktop-Default /home/idsia/Repositories/rnp_xbee_bridge/build-src-Desktop-Default/gps_driver /home/idsia/Repositories/rnp_xbee_bridge/build-src-Desktop-Default/gps_driver/CMakeFiles/gps_driver.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : gps_driver/CMakeFiles/gps_driver.dir/depend

