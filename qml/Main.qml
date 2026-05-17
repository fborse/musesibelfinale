import Felgo
import QtQuick
import QtQuick.Controls

App {
    NavigationStack {
        AppPage {
            title: qsTr("Main Page")

            Column {
                id: octaveColumn

                width: headerRect.width + 2 * padding
                height: parent.height

                spacing: dp(8)
                padding: dp(8)

                Rectangle {
                    id: headerRect

                    width: headerLabel.width + dp(8)
                    height: headerLabel.height + dp(8)

                    color: "gray"
                    border.color: "lightgray"
                    border.width: dp(2)

                    Label {
                        id: headerLabel
                        text: "Octave"

                        anchors.centerIn: parent
                    }
                }

                ListView {
                    id: listView

                    width: headerRect.width
                    height: parent.height

                    spacing: dp(8)

                    model: [3, 4, 5]

                    delegate: Label {
                        required property string modelData
                        text: modelData
                        width: parent.width

                        required property int index
                        TapHandler {
                            onTapped: listView.currentIndex = index
                        }
                    }

                    highlight: Rectangle {
                        color: "gray"
                        radius: dp(2)
                    }
                }
            }

            PianoKeyboard {
                anchors.left: octaveColumn.right
                anchors.right: parent.right
                height: parent.height

                octave: "4"//octaveView.currentIndex + 3
                duration: "4"

                onNoteTapped: note => console.log("Key", note, "tapped !")
            }
        }
    }
}
