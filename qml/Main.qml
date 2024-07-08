import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    id: root
    width: 1200
    height: 600
    visible: true

    ColumnLayout {
        anchors.fill: parent
        spacing: 2

        RowLayout {
            Rectangle {
                id: databaseSelection
                Layout.preferredWidth: 160
                Layout.preferredHeight: 50
                ComboBox {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.margins: 2
                    model: ["Database 1", "Database 2", "Database 3"]
                }

                Text {
                        anchors.bottom: parent.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "Select Database"
                        font.pointSize: 15
                    }
            }
            Rectangle {
                Layout.preferredWidth: 160
                Layout.preferredHeight: databaseSelection.height
                color: "#00ff00"
            }
        }

        RowLayout {
            spacing: 2
            Tables{}
            StackView {
                id: stackView
                Layout.fillHeight: true
                Layout.fillWidth: true
                initialItem: Initial{}
            }
        }
    }
}
