import QtQuick
import QtQuick.Layouts

Rectangle {
    Layout.preferredHeight: root.toolbarHeight
    Layout.preferredWidth: 60

    ColumnLayout {
        anchors.fill: parent

        //spacing: 0

        Image {
            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
            source: "../icons/toolbar-switch-to-sql@2x.png"
            sourceSize.height: 36 // Set the desired height
            sourceSize.width: 36 // Set the desired width
        }
        Text {
            Layout.bottomMargin: 5
            Layout.fillHeight: true
            Layout.fillWidth: true
            font.pixelSize: 14
            horizontalAlignment: Text.AlignHCenter
            text: "Query"
            verticalAlignment: Text.AlignVCenter
        }
    }
}
