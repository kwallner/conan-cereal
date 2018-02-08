#
# Copyright 2017 Karl Wallner <karl.wallner@gmx.de>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"),
# to deal in the Software without restriction, including without limitation
# the rights to use, copy, modify, merge, publish, distribute, sublicense,
# and/or sell copies of the Software, and to permit persons to whom
# the Software is furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included
# in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
# THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
# IN THE SOFTWARE.
#
# Tries to find Cereal headers 
#
# Usage of this module as follows:
#  set(CEREAL_ROOT ...)
#  find_package(Cereal)
#
# Variables used by this module:
#
#  CEREAL_ROOT               Path to Cereal installation root
#
# Variables defined by this module:
#
#  CEREAL_FOUND              System has Cereal libs/headers
#  CEREAL_INCLUDE_DIR        The location of Cereal headers
#
# Exported targets:
#  Cereal                  Cereal Library 
# 
find_path(CEREAL_INCLUDE_DIR
    cereal/cereal.hpp
    HINTS
    ${CEREAL_ROOT}/include
    $ENV{CEREAL_ROOT}/include
    )

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Cereal
    DEFAULT_MSG
    CEREAL_INCLUDE_DIR)

if (CEREAL_INCLUDE_DIR)
    set(CEREAL_FOUND TRUE)
endif(CEREAL_INCLUDE_DIR)

mark_as_advanced(CEREAL_FOUND
    Cereal_INCLUDE_DIR
    )

if(CEREAL_FOUND)
    add_library(Cereal INTERFACE IMPORTED)
    
    set_target_properties(Cereal PROPERTIES
        INTERFACE_INCLUDE_DIRECTORIES "${CEREAL_INCLUDE_DIR}")
    
    message(STATUS "-- Found Cereal:")
    message(STATUS "--   Cereal Include directories: ${CEREAL_INCLUDE_DIR}")
endif(CEREAL_FOUND)
