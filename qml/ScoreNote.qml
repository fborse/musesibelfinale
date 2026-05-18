import QtQuick

Canvas {
    required property string note
    required property double linesDistance

    readonly property string pitch: note.split(":")[0]
    readonly property int octave: note.split(":")[1]
    readonly property int duration: note.split(":")[2]

    readonly property int tone: "CDEFGAH".indexOf(pitch[0])
    readonly property int octaveShift: (octave - 3) * 7
    readonly property int noteIndex: tone + octaveShift
    readonly property bool sharp: pitch[1] === "#"

    function drawNoteHead(ctx, centerY, ellipseW, ellipseH) {
        ctx.beginPath();
    //  centred at (0, centerY)
        ctx.ellipse(-ellipseW/2, centerY - ellipseH/2, ellipseW, ellipseH);

        if (duration > 2)
            ctx.fill();
        else
            ctx.stroke();
    }

    function drawNoteHeadLine(ctx, y, totalWidth) {
        ctx.beginPath();
    //  centred at (0, y)
        ctx.moveTo(-totalWidth/2, y);
        ctx.lineTo(totalWidth/2, y);

        ctx.stroke();
    }

    function drawSharp(ctx, centerY, noteW) {
        ctx.beginPath();

        const x0 = -3 * noteW/2;
        const y0 = centerY - noteW/2;
    //  vertical right
        ctx.moveTo(x0 + 3*noteW/4, y0);
        ctx.lineTo(x0 + 3*noteW/4, y0 + noteW);
    //  vertical left
        ctx.moveTo(x0 + noteW/2, y0);
        ctx.lineTo(x0 + noteW/2, y0 + noteW);
    //  top angled "horizontal"
        ctx.moveTo(x0 + noteW, y0);
        ctx.lineTo(x0, y0 + noteW/4);
    //  bottom angled "horizontal"
        ctx.moveTo(x0 + noteW, y0 + 3*noteW/4);
        ctx.lineTo(x0, y0 + noteW);

        ctx.stroke();
    }

    function toY(index) {
        return (13 - index) * linesDistance / 2;
    }

    function drawNote(ctx) {
        drawNoteHead(ctx, toY(noteIndex), 1.5 * linesDistance, linesDistance);
        if (sharp)
            drawSharp(ctx, toY(noteIndex), 1.5 * linesDistance);

        var j;
        for (j = 7; j >= noteIndex; j -= 2)
            drawNoteHeadLine(ctx, toY(j), 2.25 * linesDistance);
        for (j = 19; j <= noteIndex; j += 2)
            drawNoteHeadLine(ctx, toY(j), 2.25 * linesDistance);
    }

    onPaint: {
        var ctx = getContext("2d");
        ctx.translate(width / 2, height / 2);

        if (pitch === "#")
        {}
        else
            drawNote(ctx);
    }
}
