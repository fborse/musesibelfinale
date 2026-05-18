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

    function drawNoteHead(ctx, y, w, h) {
        ctx.beginPath();
    //  ellipse centred at (0, y)
        ctx.ellipse(-w/2, y - h/2, w, h);

        if (duration > 2)
            ctx.fill();
        else
            ctx.stroke();
    }

    function toY(index) {
        return (13 - index) * linesDistance / 2;
    }

    function drawNote(ctx) {
        drawNoteHead(ctx, toY(noteIndex), 1.5 * linesDistance, linesDistance);
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
