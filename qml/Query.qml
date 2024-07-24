import QtQuick
import QtQuick.Controls

Item {
    width: 400
    height: 300

    Rectangle {
        anchors.fill: parent
        color: "lightgray"

        Row {
            anchors.fill: parent
            spacing: 10

            // 行号显示
            Column {
                id: lineNumbers
                width: 30
                Repeater {
                    model: textEdit.lineCount
                    Text {
                        text: index + 1
                        color: "gray"
                        font.bold: true
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                    }
                }
            }

            // 文本编辑区域
            TextEdit {
                id: textEdit
                width: parent.width - lineNumbers.width - 10
                height: parent.height
                font.pixelSize: 16
                wrapMode: TextEdit.WrapWord
            }
        }
    }
}