import QtQuick
import QtQuick.Controls

Rectangle {
    // 根据行数更新行号宽度
    function updateLineNumberWidth() {
        if (textEdit.lineCount > 9) {
            let length = String(textEdit.lineCount).length;
            lineNumbers.width = root.lineNumberWidth + (length - 1) * 6;
        }
    }

    color: "lightgray"

    Row {
        id: query

        anchors.fill: parent
        spacing: 5

        Column {
            id: lineNumbers

            width: root.lineNumberWidth

            Repeater {
                model: textEdit.lineCount

                Text {
                    id: numberText

                    anchors.left: parent.left
                    anchors.right: parent.right
                    color: "gray"
                    font.family: "Courier New"
                    font.pixelSize: 14
                    height: textEdit.cursorRectangle.height
                    horizontalAlignment: Text.AlignRight
                    text: index + 1
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }

        // 文本编辑区域
        TextEdit {
            id: textEdit

            anchors.leftMargin: 10
            font.pixelSize: 16
            height: parent.height
            width: parent.width - lineNumbers.width - 10

            onLineCountChanged: updateLineNumberWidth() // 监听行数变化
        }
    }
}
