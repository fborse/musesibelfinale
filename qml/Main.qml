import Felgo
import QtQuick

App {
    NavigationStack {
        AppPage {
            title: qsTr("Main Page")

            PianoKeyboard {
                anchors.fill: parent

                octave: "4"
                duration: "4"

                onNoteTapped: note => console.log("Key", note, "tapped !")
            }
        }
    }
}
