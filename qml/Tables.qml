import QtQuick
import QtQuick.Layouts

Rectangle {
    color: "lightgreen"
    Layout.preferredWidth: 200
    Layout.fillHeight: true

    ListView {
        anchors.fill: parent

        model: ListModel {
            ListElement {name: "table1"}
            ListElement {name: "table2"}
        }

        delegate: Text {
            text: name
        }
    }
}