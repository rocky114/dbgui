cmake_minimum_required(VERSION 3.16)

project(database-desktop VERSION 0.1 LANGUAGES CXX)

find_package(Qt6 6.5 COMPONENTS Quick Gui REQUIRED)

qt_standard_project_setup(REQUIRES 6.5)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

qt_policy(SET QTP0001 NEW)

add_subdirectory(src)



