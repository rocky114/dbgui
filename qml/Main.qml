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
                width: 200
                height: 50

                ComboBox {
                    id: comboBox
                    anchors.fill: parent
                    model: ListModel {
                        id: databaseModel
                        ListElement {name: "test"}
                        ListElement {name: "mysql"}
                        ListElement {name: "myssql"}
                    }
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
                            text: model.name // 使用 modelData 来访问数据
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                comboBox.currentIndex = index // 修改当前值为代理的索引值
                                comboBox.displayText = comboBox.model.get(index).name
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

