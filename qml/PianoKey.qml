import QtQuick

Rectangle {
    id: key
    signal tapped

    required property color restColor
    required property double radius

    bottomLeftRadius: radius
    bottomRightRadius: radius

    color: tapHandler.pressed? "gray" : restColor
    border.color: "black"
    border.width: dp(2)

    TapHandler {
        id: tapHandler
        gesturePolicy: TapHandler.ReleaseWithinBounds

        onTapped: key.tapped()
    }
}
