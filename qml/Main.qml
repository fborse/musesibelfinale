import Felgo
import QtQuick
import QtQuick.Controls

App {
    NavigationStack {
        AppPage {
            title: qsTr("Main Page")

            ListView {
                id: octaveView

                width: dp(100)
                height: parent.height

                model: [3, 4, 5]

                delegate: Label {
                    required property string modelData
                    text: modelData

                    required property int index
                    TapHandler {
                        onTapped: octaveView.currentIndex = index
                    }
                }
            }

            PianoKeyboard {
                anchors.left: octaveView.right
                anchors.right: parent.right
                height: parent.height

                octave: octaveView.currentIndex + 3
                duration: "4"

                onNoteTapped: note => console.log("Key", note, "tapped !")
            }
        }
    }
}
