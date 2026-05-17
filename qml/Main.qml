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

                    PianoKey {
                        width: parent.width / 8
                        height: parent.height

                        restColor: "white"
                        radius: dp(8)

                        required property string modelData
                        onTapped: console.log("Key", modelData, "tapped !")
                    }
                }
            }

            Item {
                anchors.fill: parent

                Repeater {
                    model: "CD"

                    PianoKey {
                        required property int index
                        x: (index + 1) * parent.width/8 - width/2

                        width: parent.width / 16
                        height: 2 * parent.height / 3

                        restColor: "black"
                        radius: dp(4)

                        required property string modelData
                        onTapped: console.log("Key", modelData + "#", "tapped !")
                    }
                }

                Repeater {
                    model: "FGA"

                    PianoKey {
                        required property int index
                        x: (index + 4) * parent.width/8 - width/2

                        width: parent.width / 16
                        height: 2 * parent.height / 3

                        restColor: "black"
                        radius: dp(4)

                        required property string modelData
                        onTapped: console.log("Key", modelData + "#", "tapped !")
                    }
                }
            }
        }
    }
}
