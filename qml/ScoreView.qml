import QtQuick

Rectangle {
    id: root

    color: "white"

    Staff {
        anchors.centerIn: parent
        width: parent.width * 0.9
        height: parent.height / 4
    }
}
