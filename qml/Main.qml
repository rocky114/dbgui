import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import rocky.database

ApplicationWindow {
    id: root

    readonly property int lineNumberWidth: 15
    readonly property int tableNavWidth: 200
    readonly property int toolbarHeight: 50

    height: 600
    visible: true
    width: 1200

    MySQL {
        id: mysql

    }
    ColumnLayout {
        anchors.fill: parent
        spacing: 2

        Toolbar {
            id: toolbarContainer

        }
        RowLayout {
            spacing: 0

            Tables {
                id: tablesContainer

            }
            StackView {
                id: stackView

                Layout.fillHeight: true
                Layout.fillWidth: true

                initialItem: Query {
                }
            }
        }
    }
}
