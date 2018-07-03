'use strict';
var beats=(function () {
    var d=new Date();
    d.setTime(d.getTime() + (1 * 60 * 60 * 1000));
    var beats=Math.floor(
        (
            (d.getUTCSeconds()) +
            (d.getUTCMinutes() * 60) +
            (d.getUTCHours() * 3600)
        ) /
        86.4
    );
    return "@"+beats;
});
if (typeof module !== 'undefined') { module.exports = beats; }
