import QtQuick
import QtQuick.Layouts

Rectangle {
    color: "lightgreen"
    Layout.preferredWidth: 200
    Layout.fillHeight: true

    signal updatedTables()

    onUpdatedTables: {
        console.log("tables changed")
        tableModel.clear()
        mysql.tables.forEach((elem, index) => {tableModel.append({name: elem})})
    }

    ListView {
        anchors.fill: parent
        width: parent.width

        model: ListModel {
            id: tableModel
        }

        delegate: Item {
            width: parent.width
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
                    //comboBox.currentIndex = index // 修改当前值为代理的索引值
                }
            }
        }

        /*
        Component.onCompleted: {
            mysql.getTables().forEach((elem, index) => {tableModel.append({name: elem})})
        }
        */
    }
}