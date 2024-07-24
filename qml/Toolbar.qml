import QtQuick
import QtQuick.Layouts

Rectangle {
    Layout.preferredWidth: 80
    Layout.preferredHeight: 80
    color: "#00ff00"

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        Image {
            source: "../icons/toolbar-switch-to-sql@2x.png"
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignVCenter
        }

        Text {
            font.pixelSize: 14
            text: "Query"
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }
}
