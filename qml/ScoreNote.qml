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

    function drawSharp(ctx, headCenterY, noteW) {
        ctx.beginPath();

        const x0 = -3 * noteW/2;
        const y0 = headCenterY - noteW/2;
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

    function drawNoteStem(ctx, headCenterY, noteW, goesUp, stemLength) {
        ctx.beginPath();

        const x = goesUp? noteW/2 : -noteW/2;

        ctx.moveTo(x, headCenterY);
        if (goesUp)
            ctx.lineTo(x, headCenterY - stemLength);
        else
            ctx.lineTo(x, headCenterY + stemLength);

        ctx.stroke();
    }

    function toY(index) {
        return (13 - index) * linesDistance / 2;
    }

    function drawNote(ctx) {
        const noteW = 1.5 * linesDistance;

        drawNoteHead(ctx, toY(noteIndex), noteW, linesDistance);
        if (sharp)
            drawSharp(ctx, toY(noteIndex), noteW);

        var j;
        for (j = 7; j >= noteIndex; j -= 2)
            drawNoteHeadLine(ctx, toY(j), 1.5 * noteW);
        for (j = 19; j <= noteIndex; j += 2)
            drawNoteHeadLine(ctx, toY(j), 1.5 * noteW);

        if (duration > 1)
            drawNoteStem(ctx, toY(noteIndex), noteW, (noteIndex < 13), 2.5 * noteW);
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
