import QtQuick

Item {
    id: keyboard

    required property string octave
    required property string duration

    signal noteTapped(note: string)

    function emitNoteTapped(pitch) {
        const oct = (pitch[0] === "_")? "0" : octave;

        keyboard.noteTapped(pitch + ":" + oct + ":" + duration);
    }

    Row {
        anchors.fill: parent

        Repeater {
            model: "CDEFGAH"

            WhitePianoKey {
                required property string modelData
                onTapped: emitNoteTapped(modelData)
            }
        }

        WhitePianoKey {
            restColor: "#606060"
            onTapped: emitNoteTapped("_")
        }
    }

    Item {
        anchors.fill: parent

        Repeater {
            model: "CD"

            BlackPianoKey {
                required property int index
                x: (index + 1) * parent.width/8 - width/2

                required property string modelData
                onTapped: emitNoteTapped(modelData + "#")
            }
        }

        Repeater {
            model: "FGA"

            BlackPianoKey {
                required property int index
                x: (index + 4) * parent.width/8 - width/2

                required property string modelData
                onTapped: emitNoteTapped(modelData + "#")
            }
        }
    }
}
