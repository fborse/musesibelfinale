import QtQuick

Canvas {
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
