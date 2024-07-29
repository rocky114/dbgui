import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import rocky.database

ColumnLayout {
    // 根据行数更新行号宽度
    function updateLineNumberWidth() {
        if (textEdit.lineCount > 9) {
            let length = String(textEdit.lineCount).length;
            lineNumbers.width = root.lineNumberWidth + (length - 1) * 6;
        } else {
            lineNumbers.width = root.lineNumberWidth;
        }
    }

    spacing: 0

    Rectangle {
        Layout.fillHeight: true
        Layout.fillWidth: true

        Row {
            id: query

            height: parent.height / 2
            spacing: 5
            width: parent.width

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
    Rectangle {
        Layout.fillWidth: true
        Layout.preferredHeight: 36
        //border.color: "#bdbcbc"
        //border.width: 1
        color: "transparent"

        Button {
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            text: "运行所选SQL"

            onClicked: sqlQueryModel.executeQuery(textEdit.text)
        }
    }
    TableModel {
        id: sqlQueryModel

        onDataChanged: {
            tableView.forceLayout();
        }
        onHeaderDataChanged: {
            tableView.model.headerDataChanged(Qt.Horizontal, 0, tableView.columnCount - 1);
        }
    }
    Rectangle {
        Layout.fillHeight: true
        Layout.fillWidth: true
        color: "transparent"

        TableView {
            id: tableView

            anchors.fill: parent
            clip: true
            columnSpacing: 1
            model: sqlQueryModel
            rowSpacing: 1

            delegate: Rectangle {
                //border.width: 1
                implicitHeight: 50
                implicitWidth: 100

                Text {
                    anchors.centerIn: parent
                    text: display
                }
            }
        }
    }
}
