cmake_minimum_required(VERSION 3.16)

project(database-desktop VERSION 0.1 LANGUAGES CXX)

find_package(Qt6 6.5 COMPONENTS Quick Gui REQUIRED)

qt_standard_project_setup(REQUIRES 6.5)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

qt_policy(SET QTP0001 NEW)

qt_add_executable(desktop
    main.cpp mysql.cpp
)

qt_add_qml_module(desktop
    URI rocky.database
    VERSION 1.0
    QML_FILES
        qml/Main.qml
        qml/Initial.qml
        qml/Tables.qml
)

target_link_libraries(desktop
    PRIVATE Qt6::Gui Qt6::Quick
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(desktop PROPERTIES
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)



