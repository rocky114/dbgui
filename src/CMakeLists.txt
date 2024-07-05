qt_add_executable(desktop
    main.cpp
)

qt_add_qml_module(desktop
    URI myqmllib
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