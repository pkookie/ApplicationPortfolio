// Function Taken from Flexi
function guessTime(v) {
    /* Lets change some common seperators and replace with the appropriate colon */
    v = v.replace(/;/gi, ":");
    v = v.replace(/\./gi, ":");
    v = v.replace(/,/gi, ":");

    /* 3or4 LETTERS WITH NO COLON: We should try and add one in for them. */
    if ((v.length == 3 || v.length == 4) && v.indexOf(':') < 0) {
        v = v.substr(0, v.length - 2) + ':' + v.substr(v.length - 2);
        /* What the devil?!: Not even three characters? How is this even a time?! Here, let me add a :00 for you. */
    } else if ((v.length == 1 || v.length == 2) && v.indexOf(':') < 0) {
        v = v + ':00';
    }
    var timeStamp = formatTime(v);
    if (timeStamp == null) return ""; // QUIT if the time is an invalid time.

    return timeStamp;
}

function formatTime(time) {
    if (time.indexOf(':') < 0) return null;
    var timeParts = time.split(':');
    if (timeParts.length != 2) return null;

    var d = new Date(2000, 1, 1, timeParts[0], timeParts[1], 0);
    if (isNaN(d.getTime())) return null;

    var hours = "0" + d.getHours().toString();
    var minutes = "0" + d.getMinutes().toString();
    return hours.substr(hours.length - 2) + ':' + minutes.substr(minutes.length - 2);
}

function toMinutes(time) {
    if (time == "" || time == null) return 0;
    if (time.indexOf(':') < 0) return 0;
    var parts = time.split(':');
    var h = parseInt(parts[0] * 1, 10);
    var isNeg = (time.indexOf('-') >= 0);

    var m = parseInt(parts[1], 10);
    var t = 0;
    if (isNeg) {
        t = (h * 60) - m;
    } else {
        t = (h * 60) + m;
    }
    if (isNaN(t)) return 0;
    return t;
}

function toTimeString(minutes, zeroPadHour) {
    /* If it's negative, make it positive for the duration of the conversion */
    var isNeg = (minutes < 0);
    if (isNeg) minutes = (minutes * -1)

    var h = (Math.floor(minutes / 60));
    var m = "0" + (minutes % 60);

    var _time = ":" + m.substr(m.length - 2);
    if (zeroPadHour == true) {
        _time = ("0" + h).substr(h.length - 2) + _time;
    } else {
        _time = h + _time;
    }
    if (isNeg) _time = "-" + _time;

    return _time;
}

$(".EasySelect").live("click", function (e) {
    $(this).select();
});

$(".TimeInputBox").live("blur", function (e) {
    var v = guessTime($(this).val());
    var m = toMinutes(v);

    $(this).val(toTimeString(m));
});
