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
                    anchors.top: parent.top
                    anchors.topMargin: 5
                    width: parent.width
                    model: mysql.databases
                    currentIndex: 0
                    onCurrentIndexChanged: {
                        console.log("Current index changed:", currentIndex, "Text:", currentText)
                    }

                    onActivated: {
                        var selectedDatabase = comboBox.model.get(currentIndex).name
                    }

                    delegate: Item {
                        width: comboBox.width
                        height: 20

                        Text {
                            anchors.left: parent.left
                            anchors.leftMargin: 10
                            font.pixelSize: 14
                            text: modelData // 使用 modelData 来访问数据
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                comboBox.currentIndex = index // 修改当前值为代理的索引值
                            }
                        }
                    }
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
            Tables {}
            StackView {
                id: stackView
                Layout.fillHeight: true
                Layout.fillWidth: true
                initialItem: Initial {}
            }
        }
    }
}

