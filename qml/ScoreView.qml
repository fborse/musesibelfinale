import QtQuick

Rectangle {
    id: root

    color: "white"

    Staff {
        id: staff

        anchors.centerIn: parent
        width: parent.width * 0.9
        height: parent.height / 4
    }

    Canvas {
        id: trebleKey

        anchors.left: staff.left
        anchors.verticalCenter: root.verticalCenter

        width: height * 0.25
        height: parent.height

        onPaint: {
            var ctx = getContext("2d");

            const linesDistance = height / 16;
            ctx.translate(width / 2, height / 2 + linesDistance);

            ctx.beginPath();

            ctx.moveTo(-linesDistance, 0);
            ctx.lineTo(0, -linesDistance);
            ctx.lineTo(linesDistance, 0);
            ctx.lineTo(-linesDistance/2, linesDistance);
            ctx.lineTo(-2*linesDistance, 0);
            ctx.lineTo(linesDistance, -3*linesDistance);
            ctx.lineTo(0, -4*linesDistance);
            ctx.lineTo(0, 2*linesDistance);
            ctx.lineTo(-linesDistance, 2*linesDistance);

            ctx.stroke();
        }
    }

    Item {
        id: timeSignature

        anchors.left: trebleKey.right
        anchors.verticalCenter: parent.verticalCenter

        width: height * 0.25
        height: parent.height

        Text {
            text: "4"
            font.pixelSize: parent.height / 9

            anchors.bottom: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            text: "4"
            font.pixelSize: parent.height / 9

            anchors.top: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
