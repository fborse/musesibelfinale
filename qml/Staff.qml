import QtQuick

Item {
    Repeater {
        model: 5

        Rectangle {
            anchors.left: parent.left
            anchors.right: parent.right

            height: dp(1)

            required property int index
            y: parent.height / 4 * index

            color: "black"
        }
    }
}
