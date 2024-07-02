import QtQuick

// 添加一个Rectangle作为顶层元素
Rectangle { // 将顶层元素命名为Page2
    id: defaultContent
    color: "red"
    
    Text {
        text: "Page 2"
        anchors.centerIn: parent
        font.pointSize: 20
    }
}
