import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import rocky.database

ApplicationWindow {
    id: root

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

        RowLayout {
            Databases {
                id: databasesContainer

            }
            Toolbar {
                id: toolbarContainer

            }
            Rectangle {
                Layout.preferredHeight: 50
                Layout.preferredWidth: 200
                color: "#00ff00"
            }
        }
        RowLayout {
            spacing: 2

            Tables {
                id: tablesContainer

            }
            StackView {
                id: stackView

                Layout.fillHeight: true
                Layout.fillWidth: true

                initialItem: Initial {
                }
            }
        }
    }
}
