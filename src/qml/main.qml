import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    id: root
    width: 1000
    height: 480
    visible: true

    ColumnLayout {
        anchors.fill: parent
        spacing: 1
        RowLayout {
            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 30
                color: "lightblue"
            }
        }

        RowLayout {
            Rectangle {
                color: "lightgreen"
                Layout.preferredWidth: 120
                Layout.fillHeight: true
            }
             Rectangle {
                color: "red"
                Layout.fillWidth: true
                Layout.fillHeight: true
            }
        }
    }
}
