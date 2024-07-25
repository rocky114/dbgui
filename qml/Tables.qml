import QtQuick
import QtQuick.Layouts

Rectangle {
    signal updatedTables

    Layout.fillHeight: true
    Layout.preferredWidth: root.tableNavWidth
    color: "lightgreen"

    onUpdatedTables: {
        tableModel.clear();
        mysql.getTables().forEach((elem, index) => {
            tableModel.append({
                name: elem
            });
        });
    }

    ListView {
        anchors.fill: parent
        width: parent.width

        delegate: Item {
            height: 20
            width: 200

            RowLayout {
                anchors.fill: parent
                anchors.leftMargin: 5 // 左侧边距
                anchors.rightMargin: 5 // 右侧边距

                Image {
                    Layout.alignment: Qt.AlignLeft
                    source: "../icons/table-small@2x.png"
                }
                Text {
                    Layout.alignment: Qt.AlignLeft
                    Layout.fillWidth: true
                    font.pixelSize: 14
                    text: modelData
                }
            }
            MouseArea {
                anchors.fill: parent

                onClicked: {}
            }
        }
        model: ListModel {
            id: tableModel

        }
    }
}
