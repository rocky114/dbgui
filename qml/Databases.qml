import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

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
            mysql.database = currentText
            console.log("Current index changed:", currentIndex, "Text:", currentText)
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
