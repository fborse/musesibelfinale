import QtQuick

Rectangle {
    required property list<string> notes

    color: "white"

    readonly property int notesLength: Math.max(13, notes.length)
//  (trebleKey + timeSignature + notes) * staff factor
    readonly property double contentsWidth: (0.25 + 0.25 + 0.5 * notesLength) * parent.height
    implicitWidth: contentsWidth / 0.9

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

            ScoreNote {
                width: height * 0.5
                height: parent.height

                anchors.verticalCenter: parent.verticalCenter

                required property string modelData
                note: modelData

                linesDistance: staff.height / 4
            }
        }
    }
}
