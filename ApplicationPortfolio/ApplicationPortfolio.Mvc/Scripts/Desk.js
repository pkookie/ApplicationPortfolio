$(document).ready(function () {

    $(".datepicker27").datepicker(
    {
        firstDay: 1,
        dateFormat: 'dd/mm/yy',
        minDate: "today",
        maxDate: "+27D"
    });

    $(".datepicker").datepicker(
    {
        firstDay: 1,
        dateFormat: 'dd/mm/yy'
    });


    /* ---- Trigger Checks & Searches ----
    * Based on information that is currently set in the criteria input boxes, potentially perform an automatic search 
    *  asyncronously, or ignore for the time being.
    */
    $("#Criteria_BuildingID").change(function () {
        UpdateZones($(this).val(), "#Criteria_FloorID", "#floorContainer", "- select floor -");
    });
    $("#Criteria_FloorID").change(function () {
        UpdateZones($(this).val(), "#Criteria_ZoneID", "#zoneContainer", "All Zones");
    });
    $("#Criteria_ZoneID").change(function () {
        UpdateZones($(this).val(), "#Criteria_SubZoneID", "#subzoneContainer", "All Zones");
    });
    $("#Criteria_SubZoneID").change(PerformSearch);
    $("#Criteria_Date").change(PerformSearch);
    //$("#timeOfDayRadio").change(PerformSearch);


    /* Update a drop down box with the changed zones */
    function UpdateZones(parentNode, updateBox, container, defaultText) {
        $.ajax({
            url: webRoot + 'Data/GetZones/?time=' + new Date().getTime(),
            data: { node: parentNode },
            success: function (j) {
                var options = '<option value="">' + defaultText + '</option>';
                for (var i = 0; i < j.length; i++) {
                    options += '<option value="' + j[i].value + '">' + j[i].label + '</option>';
                }
                $(updateBox).html(options);
                if (j.length == 1) {
                    $(updateBox).val(j[0].value.toString()); // If there is only one option, we might as well select that for them.
                }
                $(updateBox).selectmenu().change();
                if (j.length > 1) {
                    $(container).show();
                }
                PerformSearch();
            }
        });
    }

    /* ---- Perform Search ------
    * The main method to call when wanting to execute the search. This takes the content of the #CriteriaForm and submits it to the same
    *  destination it would be sent to, if Ajax was disabled. The results are then displayed in the floorplan container.
    */
    function PerformSearch() {

        if ($("#Criteria_BuildingID").val() == "" || $("#Criteria_FloorID").val() == "" || $("#Criteria_Date").val() == "") {
            return; // One of the essential values is empty - we can't do anything, so return.
        }
        $("#CriteriaForm").submit();
    }

    $("#CriteriaForm").submit(function () {
        $("#please-wait").show("fade", {}, 300);
    });

    $("#Criteria_BuildingID").change(function (evt) {
        if (previousValue != "") {
            $("#floorplan").fadeOut(200);
            $.ajax({
                type: 'POST',
                url: $("#CriteriaForm").attr('action'),
                data: $("#CriteriaForm").serialize(),
                success: function (data) {
                    $("#floorplan").html(data).fadeIn(500);
                }
            });
        }
        previousValue = $("#Criteria_BuildingID").val();
    });

    $('#ConfirmForm').submit(function () {
        $(this).find("input[type='image'],input[type='submit']").click(function () {
            return false;
        });
    }); $("#Criteria_FloorID").val() == ""

    if ($("#Criteria_ZoneID option").size() > 1) {
        $("#zoneContainer").show();
    }
    if ($("#Criteria_SubZoneID option").size() > 1) {
        $("#subzoneContainer").show();
    }

    $("#notification-message.success").fadeTo(1, 0.9).css('background-color', '#FFFFFF').animate({
        'background-color': '#CDEE91'
    }, 2000).delay(5000).slideUp(500);

    $("#notification-message.fail").fadeTo(1, 0.9).css('background-color', '#FFFFFF').animate({
        'background-color': '#ffeeee'
    }, 2000).delay(5000).slideUp(500);

    $('#notification-message').click(function (event) {
        $('#notification-message').hide();
    });
    previousValue = $("#Criteria_BuildingID").val();



    $("#timeOfDayRadio").change(function () {
        if ($(this).find("input:checked").val() == "Other") {
            $("#otherTimeOfDay").show();
        } else {
            $("#otherTimeOfDay").hide();
        }
    });

    $("input.timebox").click(function () {
        $(this).select();
    });
    $("input.timebox").blur(function (e) {
        var v = guessTime($(this).val());
        if (getHour(v) > 24) v = "00:00";
        if (getHour(v) < 0) v = "00:00";
        $(this).val(v);
    });

    $(".OtherTimeBox .plus").click(function () {
        $box = $(this).siblings('.timebox');
        var hour = getHour($box.val());

        if (hour > 24) v = "00:00";
        if (hour < 0) v = "00:00";

        $box.val(oClock(hour + 1));
        $box.change();
    });
    $(".OtherTimeBox .minus").click(function () {
        $box = $(this).siblings('.timebox');
        var hour = getHour($box.val());

        if (hour > 24) v = "00:00";
        if (hour < 0) v = "00:00";

        $box.val(oClock(hour - 1));
        $box.change();
    });

    $('#Criteria_TimeOfDayOtherFrom').change(function () {
        var from = getHour($('#Criteria_TimeOfDayOtherFrom').val());
        var until = getHour($('#Criteria_TimeOfDayOtherUntil').val());

        if (from >= until && from < 24) {
            $('#Criteria_TimeOfDayOtherUntil').val(oClock(from + 1));
        } else if (from >= until && from >= 24) {
            $('#Criteria_TimeOfDayOtherFrom').val(oClock(from - 1));
        }
    });

    $('#Criteria_TimeOfDayOtherUntil').change(function () {
        var from = getHour($('#Criteria_TimeOfDayOtherFrom').val());
        var until = getHour($('#Criteria_TimeOfDayOtherUntil').val());

        if (until <= from && until > 0) {
            $('#Criteria_TimeOfDayOtherFrom').val(oClock(until - 1));
        } else if (until <= from && until <= 0) {
            $('#Criteria_TimeOfDayOtherUntil').val(oClock(until + 1));
        }
    });

    $(document).bind("keydown", function (e) {
        var code = (e.keyCode ? e.keyCode : e.which);
        if (code == 13) {
            var v = guessTime($(e.srcElement).val());
            $(e.srcElement).val(v);
            $("#SearchButton").focus(); // Lose focus and recalculate totals.
            e.preventDefault();
            return false;
        }
    });
});

/* SVGWEB: Trigger to say the SVG file has loaded...*/
window.onsvgload = function (evt) {
    $("#please-wait").hide("fade", {}, 500);
    $("#svg-error").hide();
};

/* Modern Browsers: Because we're not including SVGWeb, we judge to hide the "loading" screen when the entire
    page has loaded. This will generally be caused by the SVG loading, but in instances where it's not the slowest
    thing on the page - it may have undesireable outcomes. */
$(window).load(function () {
    $("#please-wait").hide("fade", {}, 500);
    $("#svg-error").hide();
});

setTimeout(function () {
    $("#please-wait").hide("fade", {}, 500);
}, 30000);

function oClock(hour) {
    hours = ("0" + hour);
    return hours.substr(hours.length - 2) + ':00';
}

function getHour(value) {
    if (value.indexOf(':') < 0) return null;
    var timeParts = value.split(':');
    if (timeParts.length != 2) return null;
    return parseInt(timeParts[0]);
}

function guessTime(v) {
    /* Lets change some common seperators and replace with the appropriate colon */
    v = v.replace(/;/gi, ":");
    v = v.replace(/\./gi, ":");
    v = v.replace(/,/gi, ":");

    /* 3or4 LETTERS WITH NO COLON: We should try and add one in for them. */
    if ((v.length == 3 || v.length == 4) && v.indexOf(':') < 0) {
        if (v.indexOf("-") < 0) {
            v = v.substr(0, v.length - 2) + ':' + v.substr(v.length - 2);
        } else {
            v = v + ':00';
        }

        /* What the devil?!: Not even three characters? How is this even a time?! Here, let me add a :00 for you. */
    } else if ((v.length == 1 || v.length == 2) && v.indexOf(':') < 0) {
        v = v + ':00';
    }
    var timeStamp = formatTime(v);
    if (timeStamp == null) return ""; // QUIT if the time is an invalid time.

    return timeStamp;
}

/* Double checks a string is a validly formatted date.
* This function returns a string which may be a new & improved version of the string passed in. */
function formatTime(time) {
    if (time.indexOf(':') < 0) return null;
    var timeParts = time.split(':');
    if (timeParts.length != 2) return null;

    if (time.indexOf('-') < 0) {
        var d = new Date(2000, 1, 1, timeParts[0], timeParts[1], 0);
        if (isNaN(d.getTime())) return null;

        var hours = "0" + d.getHours().toString();
        //var minutes = "0" + d.getMinutes().toString();
        var minutes = "00";
        return hours.substr(hours.length - 2) + ':' + minutes.substr(minutes.length - 2);

    } else {
        var hours = timeParts[0];
        //var minutes = "0" + timeParts[1];
        var minutes = "00";
        return hours + ':' + minutes.substr(minutes.length - 2);
    }
}