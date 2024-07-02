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
        spacing: 2

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 30
            color: "lightblue"
        }
        
        RowLayout {
            spacing: 2
            Rectangle {
                color: "lightgreen"
                Layout.preferredWidth: 120
                Layout.fillHeight: true
            }
            StackView {
                id: stackView
                Layout.fillHeight: true
                Layout.fillWidth: true
                initialItem: DefaultContent{}
            }
        }
    }
}
