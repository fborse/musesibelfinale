import Felgo
import QtQuick

App {
    NavigationStack {
        AppPage {
            title: qsTr("Main Page")

            Row {
                anchors.fill: parent

                Repeater {
                    model: "CDEFGAHc"

                    WhitePianoKey {
                        required property string modelData
                        onTapped: console.log("Key", modelData, "tapped !")
                    }
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
                        onTapped: console.log("Key", modelData + "#", "tapped !")
                    }
                }

                Repeater {
                    model: "FGA"

                    BlackPianoKey {
                        required property int index
                        x: (index + 4) * parent.width/8 - width/2

                        required property string modelData
                        onTapped: console.log("Key", modelData + "#", "tapped !")
                    }
                }
            }
        }
    }
}
