# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


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
CMAKE_SOURCE_DIR = /home/tao/no996/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/tao/no996/build

# Utility rule file for sdf.

# Include the progress variables for this target.
include CICRSIM-master/rotors_simulator/rotors_gazebo/CMakeFiles/sdf.dir/progress.make

CICRSIM-master/rotors_simulator/rotors_gazebo/CMakeFiles/sdf: /home/tao/no996/src/CICRSIM-master/rotors_simulator/rotors_gazebo/models/iris/iris.sdf


/home/tao/no996/src/CICRSIM-master/rotors_simulator/rotors_gazebo/models/iris/iris.sdf: /home/tao/no996/src/CICRSIM-master/rotors_simulator/rotors_gazebo/models/rotors_description/urdf/iris.xacro
/home/tao/no996/src/CICRSIM-master/rotors_simulator/rotors_gazebo/models/iris/iris.sdf: /home/tao/no996/src/CICRSIM-master/rotors_simulator/rotors_gazebo/models/rotors_description/urdf/iris_base.xacro
/home/tao/no996/src/CICRSIM-master/rotors_simulator/rotors_gazebo/models/iris/iris.sdf: /home/tao/no996/src/CICRSIM-master/rotors_simulator/rotors_gazebo/models/rotors_description/urdf/component_snippets.xacro
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/tao/no996/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating /home/tao/no996/src/CICRSIM-master/rotors_simulator/rotors_gazebo/models/iris/iris.sdf"
	cd /home/tao/no996/src/CICRSIM-master/rotors_simulator/rotors_gazebo && rm -f /home/tao/no996/src/CICRSIM-master/rotors_simulator/rotors_gazebo/models/iris/iris.sdf
	cd /home/tao/no996/src/CICRSIM-master/rotors_simulator/rotors_gazebo && /usr/bin/python3 /home/tao/no996/src/CICRSIM-master/rotors_simulator/rotors_gazebo/scripts/xacro.py -o /home/tao/no996/src/CICRSIM-master/rotors_simulator/rotors_gazebo/models/rotors_description/urdf/iris_base.urdf /home/tao/no996/src/CICRSIM-master/rotors_simulator/rotors_gazebo/models/rotors_description/urdf/iris_base.xacro enable_mavlink_interface:=true enable_ground_truth:=false enable_wind:=false enable_logging:=false rotors_description_dir:=/home/tao/no996/src/CICRSIM-master/rotors_simulator/rotors_gazebo/models/rotors_description
	cd /home/tao/no996/src/CICRSIM-master/rotors_simulator/rotors_gazebo && gz sdf -p /home/tao/no996/src/CICRSIM-master/rotors_simulator/rotors_gazebo/models/rotors_description/urdf/iris_base.urdf >> /home/tao/no996/src/CICRSIM-master/rotors_simulator/rotors_gazebo/models/iris/iris.sdf
	cd /home/tao/no996/src/CICRSIM-master/rotors_simulator/rotors_gazebo && rm -f /home/tao/no996/src/CICRSIM-master/rotors_simulator/rotors_gazebo/models/rotors_description/urdf/iris_base.urdf

sdf: CICRSIM-master/rotors_simulator/rotors_gazebo/CMakeFiles/sdf
sdf: /home/tao/no996/src/CICRSIM-master/rotors_simulator/rotors_gazebo/models/iris/iris.sdf
sdf: CICRSIM-master/rotors_simulator/rotors_gazebo/CMakeFiles/sdf.dir/build.make

.PHONY : sdf

# Rule to build all files generated by this target.
CICRSIM-master/rotors_simulator/rotors_gazebo/CMakeFiles/sdf.dir/build: sdf

.PHONY : CICRSIM-master/rotors_simulator/rotors_gazebo/CMakeFiles/sdf.dir/build

CICRSIM-master/rotors_simulator/rotors_gazebo/CMakeFiles/sdf.dir/clean:
	cd /home/tao/no996/build/CICRSIM-master/rotors_simulator/rotors_gazebo && $(CMAKE_COMMAND) -P CMakeFiles/sdf.dir/cmake_clean.cmake
.PHONY : CICRSIM-master/rotors_simulator/rotors_gazebo/CMakeFiles/sdf.dir/clean

CICRSIM-master/rotors_simulator/rotors_gazebo/CMakeFiles/sdf.dir/depend:
	cd /home/tao/no996/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/tao/no996/src /home/tao/no996/src/CICRSIM-master/rotors_simulator/rotors_gazebo /home/tao/no996/build /home/tao/no996/build/CICRSIM-master/rotors_simulator/rotors_gazebo /home/tao/no996/build/CICRSIM-master/rotors_simulator/rotors_gazebo/CMakeFiles/sdf.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CICRSIM-master/rotors_simulator/rotors_gazebo/CMakeFiles/sdf.dir/depend
