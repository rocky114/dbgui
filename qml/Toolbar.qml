import QtQuick
import QtQuick.Layouts

Rectangle {
    Layout.preferredWidth: 60
    Layout.preferredHeight: 50

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        Image {
            source: "../icons/toolbar-switch-to-sql@2x.png"
            sourceSize.width: 32 // Set the desired width
            sourceSize.height: 32 // Set the desired height
            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
        }

        Text {
            font.pixelSize: 14
            text: "Query"
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.bottomMargin: 5
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }
}
