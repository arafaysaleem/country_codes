# File: windows/CMakeLists.txt
cmake_minimum_required(VERSION 3.15)
set(PROJECT_NAME "country_codes")
project(${PROJECT_NAME} LANGUAGES CXX)

set(PLUGIN_NAME "${PROJECT_NAME}_plugin")

list(APPEND PLUGIN_SOURCES
  "country_codes_plugin.cpp"
  "country_codes_plugin.h"
)

add_library(${PLUGIN_NAME} SHARED
  ${PLUGIN_SOURCES}
)

apply_standard_settings(${PLUGIN_NAME})
set_target_properties(${PLUGIN_NAME} PROPERTIES CXX_VISIBILITY_PRESET hidden)
target_compile_definitions(${PLUGIN_NAME} PRIVATE FLUTTER_PLUGIN_IMPL)

# Required Flutter dependencies
target_link_libraries(${PLUGIN_NAME} PRIVATE flutter flutter_wrapper_plugin)

# Required system dependencies
target_link_libraries(${PLUGIN_NAME} PRIVATE
  "kernel32.lib"
)

# List of absolute paths to libraries that should be bundled with the plugin
set(country_codes_bundled_libraries
  ""
  PARENT_SCOPE
)
