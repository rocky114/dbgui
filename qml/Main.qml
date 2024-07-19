import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import rocky.database

ApplicationWindow {
    id: root
    width: 1200
    height: 600
    visible: true

    MySQL {
        id: mysql
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 2

        RowLayout {
            Rectangle {
                id: database
                Layout.preferredWidth: 200
                Layout.preferredHeight: 50

                ComboBox {
                    id: comboBox
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.margins: 2
                    model: mysql.databases

                    delegate: Item {
                        width: comboBox.width
                        height: 20

                        Text {
                            anchors.centerIn: parent
                            font.pixelSize: 14
                            text: modelData // 使用 modelData 来访问数据
                        }
                    }
                }

                Text {
                    anchors.bottom: parent.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Select Database"
                    font.pointSize: 15
                }
            }
            Rectangle {
                Layout.preferredWidth: 200
                Layout.preferredHeight: database.height
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

    property var databaseModel: ListModel {
        ListElement { name: "选择数据库" }
    }

    Component.onCompleted: {
        console.log("echo database")
    }

}

