import Felgo
import QtQuick
import QtQuick.Controls

App {
    NavigationStack {
        AppPage {
            title: qsTr("Main Page")

            ScrollView {
                id: scoreScrollView

                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top

                height: parent.height / 4
            }

            Item {
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: scoreScrollView.bottom
                anchors.bottom: parent.bottom

                SettingChooser {
                    id: octavesList
                    anchors.left: parent.left

                    title: qsTr("Octave")
                    entries: ["3", "4", "5"]

                    originalIndex: 1
                }

                SettingChooser {
                    id: durationsList
                    anchors.left: octavesList.right

                    title: qsTr("Duration")
                    entries: ["1/1", "1/2", "1/4", "1/8", "1/16"]

                    originalIndex: 2
                }

                PianoKeyboard {
                    anchors.left: durationsList.right
                    anchors.right: parent.right
                    height: parent.height

                    octave: octavesList.index + 3
                    duration: Math.pow(2, durationsList.index)

                    onNoteTapped: note => console.log("Key", note, "tapped !")
                }
            }
        }
    }
}
