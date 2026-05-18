import QtQuick

Rectangle {
    required property list<string> notes

    id: root
    color: "white"

    Staff {
        id: staff

        anchors.centerIn: parent
        width: parent.width * 0.9
        height: parent.height / 4
    }

    TrebleKey {
        id: trebleKey

        anchors.left: staff.left
        anchors.verticalCenter: root.verticalCenter

        width: height * 0.25
        height: parent.height
    }

    TimeSignature {
        id: timeSignature

        anchors.left: trebleKey.right
        anchors.verticalCenter: parent.verticalCenter

        width: height * 0.25
        height: parent.height
    }
}
