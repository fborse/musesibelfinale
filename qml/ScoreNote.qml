import QtQuick

Rectangle {
    required property string note

    readonly property string pitch: note.split(":")[0]
    readonly property int octave: note.split(":")[1]
    readonly property int duration: note.split(":")[2]

    color: "transparent"
    border.color: "lightblue"
    border.width: dp(1)
}
