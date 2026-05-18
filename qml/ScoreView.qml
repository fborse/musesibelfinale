import QtQuick

Rectangle {
    required property list<string> notes

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
        anchors.verticalCenter: parent.verticalCenter

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

    Row {
        anchors.left: timeSignature.right
        anchors.right: staff.right
        height: parent.height

        Repeater {
            model: notes

            Rectangle {
                width: height * 0.5
                height: parent.height

                anchors.verticalCenter: parent.verticalCenter

                required property string modelData
                color: "transparent"
                border.color: "lightblue"
                border.width: dp(1)
            }
        }
    }
}
