import QtQuick
import QtQuick.Controls

Column {
    width: headerRect.width + 2 * padding
    height: parent.height

    spacing: dp(8)
    padding: dp(8)

    required property string title
    required property list<string> entries

    property int originalIndex: 0
    readonly property int index: listView.currentIndex

    Rectangle {
        id: headerRect

        width: headerLabel.width + dp(8)
        height: headerLabel.height + dp(8)

        color: "gray"
        border.color: "lightgray"
        border.width: dp(2)

        Label {
            id: headerLabel
            text: title

            anchors.centerIn: parent
        }
    }

    ListView {
        id: listView

        width: headerRect.width
        height: parent.height

        spacing: dp(8)

        model: entries
        currentIndex: originalIndex

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
