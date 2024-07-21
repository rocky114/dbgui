import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import rocky.database

ApplicationWindow {
    id: root
    width: 1200
    height: 600
    visible: true

    MySQL {
        id: mysql
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 2

        RowLayout {
            Databases {}

            Rectangle {
                Layout.preferredWidth: 200
                Layout.preferredHeight: 50
                color: "#00ff00"
            }
        }

        RowLayout {
            spacing: 2
            Tables {}
            StackView {
                id: stackView
                Layout.fillHeight: true
                Layout.fillWidth: true
                initialItem: Initial {}
            }
        }
    }
}

