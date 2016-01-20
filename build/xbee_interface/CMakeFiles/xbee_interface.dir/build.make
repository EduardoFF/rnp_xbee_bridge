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
CMAKE_BINARY_DIR = /home/idsia/Repositories/rnp_xbee_bridge/build

# Include any dependencies generated for this target.
include xbee_interface/CMakeFiles/xbee_interface.dir/depend.make

# Include the progress variables for this target.
include xbee_interface/CMakeFiles/xbee_interface.dir/progress.make

# Include the compile flags for this target's objects.
include xbee_interface/CMakeFiles/xbee_interface.dir/flags.make

xbee_interface/CMakeFiles/xbee_interface.dir/xbee_interface.cc.o: xbee_interface/CMakeFiles/xbee_interface.dir/flags.make
xbee_interface/CMakeFiles/xbee_interface.dir/xbee_interface.cc.o: /home/idsia/Repositories/rnp_xbee_bridge/src/xbee_interface/xbee_interface.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/idsia/Repositories/rnp_xbee_bridge/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object xbee_interface/CMakeFiles/xbee_interface.dir/xbee_interface.cc.o"
	cd /home/idsia/Repositories/rnp_xbee_bridge/build/xbee_interface && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/xbee_interface.dir/xbee_interface.cc.o -c /home/idsia/Repositories/rnp_xbee_bridge/src/xbee_interface/xbee_interface.cc

xbee_interface/CMakeFiles/xbee_interface.dir/xbee_interface.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/xbee_interface.dir/xbee_interface.cc.i"
	cd /home/idsia/Repositories/rnp_xbee_bridge/build/xbee_interface && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/idsia/Repositories/rnp_xbee_bridge/src/xbee_interface/xbee_interface.cc > CMakeFiles/xbee_interface.dir/xbee_interface.cc.i

xbee_interface/CMakeFiles/xbee_interface.dir/xbee_interface.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/xbee_interface.dir/xbee_interface.cc.s"
	cd /home/idsia/Repositories/rnp_xbee_bridge/build/xbee_interface && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/idsia/Repositories/rnp_xbee_bridge/src/xbee_interface/xbee_interface.cc -o CMakeFiles/xbee_interface.dir/xbee_interface.cc.s

xbee_interface/CMakeFiles/xbee_interface.dir/xbee_interface.cc.o.requires:
.PHONY : xbee_interface/CMakeFiles/xbee_interface.dir/xbee_interface.cc.o.requires

xbee_interface/CMakeFiles/xbee_interface.dir/xbee_interface.cc.o.provides: xbee_interface/CMakeFiles/xbee_interface.dir/xbee_interface.cc.o.requires
	$(MAKE) -f xbee_interface/CMakeFiles/xbee_interface.dir/build.make xbee_interface/CMakeFiles/xbee_interface.dir/xbee_interface.cc.o.provides.build
.PHONY : xbee_interface/CMakeFiles/xbee_interface.dir/xbee_interface.cc.o.provides

xbee_interface/CMakeFiles/xbee_interface.dir/xbee_interface.cc.o.provides.build: xbee_interface/CMakeFiles/xbee_interface.dir/xbee_interface.cc.o

# Object files for target xbee_interface
xbee_interface_OBJECTS = \
"CMakeFiles/xbee_interface.dir/xbee_interface.cc.o"

# External object files for target xbee_interface
xbee_interface_EXTERNAL_OBJECTS =

xbee_interface/libxbee_interface.a: xbee_interface/CMakeFiles/xbee_interface.dir/xbee_interface.cc.o
xbee_interface/libxbee_interface.a: xbee_interface/CMakeFiles/xbee_interface.dir/build.make
xbee_interface/libxbee_interface.a: xbee_interface/CMakeFiles/xbee_interface.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX static library libxbee_interface.a"
	cd /home/idsia/Repositories/rnp_xbee_bridge/build/xbee_interface && $(CMAKE_COMMAND) -P CMakeFiles/xbee_interface.dir/cmake_clean_target.cmake
	cd /home/idsia/Repositories/rnp_xbee_bridge/build/xbee_interface && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/xbee_interface.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
xbee_interface/CMakeFiles/xbee_interface.dir/build: xbee_interface/libxbee_interface.a
.PHONY : xbee_interface/CMakeFiles/xbee_interface.dir/build

xbee_interface/CMakeFiles/xbee_interface.dir/requires: xbee_interface/CMakeFiles/xbee_interface.dir/xbee_interface.cc.o.requires
.PHONY : xbee_interface/CMakeFiles/xbee_interface.dir/requires

xbee_interface/CMakeFiles/xbee_interface.dir/clean:
	cd /home/idsia/Repositories/rnp_xbee_bridge/build/xbee_interface && $(CMAKE_COMMAND) -P CMakeFiles/xbee_interface.dir/cmake_clean.cmake
.PHONY : xbee_interface/CMakeFiles/xbee_interface.dir/clean

xbee_interface/CMakeFiles/xbee_interface.dir/depend:
	cd /home/idsia/Repositories/rnp_xbee_bridge/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/idsia/Repositories/rnp_xbee_bridge/src /home/idsia/Repositories/rnp_xbee_bridge/src/xbee_interface /home/idsia/Repositories/rnp_xbee_bridge/build /home/idsia/Repositories/rnp_xbee_bridge/build/xbee_interface /home/idsia/Repositories/rnp_xbee_bridge/build/xbee_interface/CMakeFiles/xbee_interface.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : xbee_interface/CMakeFiles/xbee_interface.dir/depend

