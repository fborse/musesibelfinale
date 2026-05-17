import Felgo
import QtQuick

App {
    NavigationStack {
        AppPage {
            title: qsTr("Main Page")

            Rectangle {
                anchors.fill: parent

                color: tapHandler.pressed? "gray" : "white"
                border.color: "black"
                border.width: dp(2)

                bottomLeftRadius: dp(16)
                bottomRightRadius: dp(16)

                TapHandler {
                    id: tapHandler
                    gesturePolicy: TapHandler.ReleaseWithinBounds

                    onTapped: console.log("Key A tapped !");
                }
            }
        }
    }
}
