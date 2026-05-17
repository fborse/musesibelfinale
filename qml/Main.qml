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

                        bottomLeftRadius: dp(8)
                        bottomRightRadius: dp(8)

                        TapHandler {
                            id: tapHandler
                            gesturePolicy: TapHandler.ReleaseWithinBounds

                            onTapped: console.log("Key", modelData, "tapped !");
                        }
                    }
                }
            }

            Item {
                anchors.fill: parent

                Repeater {
                    model: "CD"

                    Rectangle {
                        x: (index + 1) * parent.width/8 - width/2

                        width: parent.width / 16
                        height: 2 * parent.height / 3

                        color: tapHandlerCD.pressed? "gray" : "black"
                        border.color: "black"
                        border.width: dp(2)

                        bottomLeftRadius: dp(4)
                        bottomRightRadius: dp(4)

                        TapHandler {
                            id: tapHandlerCD
                            gesturePolicy: TapHandler.ReleaseWithinBounds

                            onTapped: console.log("Key", modelData + "#", "tapped !")
                        }
                    }
                }

                Repeater {
                    model: "FGA"

                    Rectangle {
                        x: (index + 4) * parent.width/8 - width/2

                        width: parent.width / 16
                        height: 2 * parent.height / 3

                        color: tapHandlerFGA.pressed? "gray" : "black"
                        border.color: "black"
                        border.width: dp(2)

                        bottomLeftRadius: dp(4)
                        bottomRightRadius: dp(4)

                        TapHandler {
                            id: tapHandlerFGA
                            gesturePolicy: TapHandler.ReleaseWithinBounds

                            onTapped: console.log("Key", modelData + "#", "tapped !")
                        }
                    }
                }
            }
        }
    }
}
