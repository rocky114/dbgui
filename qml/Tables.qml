import QtQuick
import QtQuick.Layouts

Rectangle {
    id: tables
    color: "lightgreen"
    Layout.preferredWidth: 200
    Layout.fillHeight: true

    signal updatedTables()

    onUpdatedTables: {
        tableModel.clear()
        mysql.getTables().forEach((elem, index) => {tableModel.append({name: elem})})
    }

    ListView {
        anchors.fill: parent
        width: parent.width

        model: ListModel {
            id: tableModel
        }

        delegate: Item {
            width: 200
            height: 20

            RowLayout {
                anchors.fill: parent
                anchors.leftMargin: 5 // 左侧边距
                anchors.rightMargin: 5 // 右侧边距

                Image {
                    source: "../icons/table-small@2x.png"
                    Layout.alignment: Qt.AlignLeft
                }

                Text {
                    font.pixelSize: 14
                    text: modelData
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignLeft
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                }
            }
        }
    }
}