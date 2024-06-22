qt_add_qml_module(qmllib
    URI myqmllib
    VERSION 1.0
    QML_FILES
        main.qml
)

target_link_libraries(qmllib
    PRIVATE Qt6::Gui Qt6::Quick
)

set_target_properties(qmllib PROPERTIES
    OUTPUT_DIRECTORY "/Users/huangdongcheng/tech/desktop/out/build/database/src/myqmllib"
)