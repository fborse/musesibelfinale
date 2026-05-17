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

                    Rectangle {
                        width: parent.width / 8
                        height: parent.height

                        color: tapHandler.pressed? "gray" : "white"
                        border.color: "black"
                        border.width: dp(2)

                        bottomLeftRadius: dp(16)
                        bottomRightRadius: dp(16)

                        TapHandler {
                            id: tapHandler
                            gesturePolicy: TapHandler.ReleaseWithinBounds

                            onTapped: console.log("Key", modelData, "tapped !");
                        }
                    }
                }
            }
        }
    }
}
