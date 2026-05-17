import Felgo
import QtQuick
import QtQuick.Controls

App {
    NavigationStack {
        AppPage {
            title: qsTr("Main Page")

            SettingChooser {
                id: octavesList
                anchors.left: parent.left

                title: qsTr("Octave")
                entries: ["3", "4", "5"]
            }

            PianoKeyboard {
                anchors.left: octavesList.right
                anchors.right: parent.right
                height: parent.height

                octave: octavesList.index + 3
                duration: "4"

                onNoteTapped: note => console.log("Key", note, "tapped !")
            }
        }
    }
}
