import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    Layout.preferredWidth: 200
    Layout.preferredHeight: root.toolbarHeight

    ComboBox {
        id: comboBox
        anchors.top: parent.top
        anchors.topMargin: 5
        width: parent.width
        model: ListModel {
            id: databasesModel
            ListElement {name: "选择数据库"}
        }
        currentIndex: 0
        onCurrentIndexChanged: {
        }

        onCurrentTextChanged: {
            mysql.database = currentText

            // emit signal
            tablesContainer.updatedTables()
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
                    comboBox.popup.close()
                }
            }
        }


        Component.onCompleted: {
            mysql.getDatabases().forEach((elem, index) => {databasesModel.append({name: elem})})
        }
    }
}
