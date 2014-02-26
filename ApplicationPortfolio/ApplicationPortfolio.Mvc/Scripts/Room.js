
var selectedRoom;
var selectedRoomName;

var buildingRooms;

    var i = 0;
    var colours = ["CC3333", "DE4479", "9B439A", "6432cf", "2a679b", "2d66cf", "16aa9a", "2d9968", "099714", "64ab00", 
                   "aaaa07", "d6ae00", "ec8902", "df5408", "a77072", "8e6c8a", "657486", "7083a7", "5a8e87", "878a51", "b18b57",
                   "9b3000", "892e39", "962183", "3e2277", "2b497f", "152285", "1b753c", "39820d", "579a03", "809107", "9f7000",
                   "aa5a00", "8e4400", "753500", "870f4f", "23617c", "50524f", "247f63", "a6900c", "880c11"]


// Stolen from this nice post
// http://stackoverflow.com/questions/1568312/facebook-style-ajax-search
    //

    $(document).ready(function () {
        $('table.tableOrgoniser10-25-50-100-all').dataTable({
            "aLengthMenu": [[10, 25, 50, 100, -1], [10, 25, 50, 100, "All"]],
            "aoColumnDefs": [{ "sType": "date", "aTargets": ["dateField"], "dateFormat": "dd/mm/yy"}]
        });

        $(document).ready(function () {
            $("#BackButton").click(function (event) {
                if (history.length > 1) {
                    history.back();
                    return false;
                }
                else if ($(event.target).hasClass("HandelsBackPress"))
                    return true;
                else
                    return false;
            });
        });

        // Update calendar when new room is selected
        $('input[type=radio].roomSelection').live('change', function () {
            // clear the exiting room from the calendar
            RemoveCalendarItem(selectedRoom, calendarUrl);

            selectedRoom = $(this).context.value;
            selectedRoomName = GetRoomName(selectedRoom);
            AddCalendarItem($(this).val(), 'CC3333', calendarUrl, false);
        });

    });


    function GetRoomName(RoomId) {
        for (var i = 0, len = buildingRooms.length; i < len; i++) {
            if (buildingRooms[i].value == RoomId) return buildingRooms[i].label;
        }
    }

var debounce = function (func, threshold, execAsap) {
    var timeout;
    return function debounced() {
        var obj = this, args = arguments;
        function delayed() {
            if (!execAsap)
                func.apply(obj, args);
            timeout = null;
        };
        if (timeout)
            clearTimeout(timeout);
        else if (execAsap)
            func.apply(obj, args);
        timeout = setTimeout(delayed, threshold || 100);
    };
};

function UpdateRoomsDropDown(dataUrl, target, id) {
    $.ajax({
        url: dataUrl,
        data: { building: id },
        success: function (j) {
            var options = '<option value="">- select room -</option>';
            for (var i = 0; i < j.length; i++) {
                options += '<option value="' + j[i].value + '">' + j[i].label + '</option>';
            }
            $(target).html(options);
            if (j.length == 1) {
                $(target).val(j[0].value.toString()); // If there is only one option, we might as well select that for them.
            }
            $(target).selectmenu().change();
        }
    });
}

function BookRoomAjaxBegin() {
    var selectedRoom = $("#ConfirmationViewModel_ResourceId").val();
    if (selectedRoom = "") {
    }
    else {
    }
}

function BookRoomAjaxFail(data) {
    alert("Fail");

}

function BookRoomAjaxSuccess() {
    alert("Win");
}

function CreateCalendarViewStub(resourceId, resourceName, colour) {

    var stringToInsert = '<li id="'+resourceId+'" style="cursor:pointer">';
    stringToInsert    += '<div class="floatClose">';
    stringToInsert    += '<img class="loading" style="display:none" src="'+ loaderIcons + colour.replace('#', '') + '.gif"/> ';
    stringToInsert    += '<input type="checkbox" class="checkbox" name="" value="resourceId" style="width:24px; display:inline;" /></div>';
//    stringToInsert    += '<img class="action" src="/content/icons/add.png" /></div>';
    stringToInsert    += '<div class="itemVisible" style="background-color:' + colour + ';"></div>';
    stringToInsert    += '<span class="roomName">' + resourceName + '</span>';
    stringToInsert    += '</li>';

    return stringToInsert;
}


function EndCalenderViewStubLoading(resourceId) {
}

function GetNextColour() {

    if (i >= colours.length)
        i = 0;
    var toReturn = "#" + colours[i];
    i += (Math.floor(Math.random() * 4)) + 2

    return toReturn;
}

function RemoveCalendarItem(resource, baseUrl) {
    var eventSources = {
        url: baseUrl + '/' + resource,
        type: 'GET',
        data: {
            resourceId: resource
        }
    }
    $('#calendar').fullCalendar('removeEventSource', eventSources);
}

function AddCalendarItem(resourceId, colour, calendarUrl, fillcolumn) {
    var eventSources = {
        url: calendarUrl + '/' + resourceId,
        type: 'GET',
        error: function (ex) {
            alert(ex.message);
        },
        beforeSend: function (ex) {
            $("li#" + resourceId + " div.floatClose img.loading").fadeIn('slow');
        }
                    ,
        success: function () {
            $("li#" + resourceId + " div.floatClose img.loading").fadeOut('slow');
        },
        color: colour,
        fillcolumn: fillcolumn
    };
    
    $('#calendar').fullCalendar('addEventSource', eventSources);
}

function SetCalendarItem(resourceId, colour, calendarUrl, fillcolumn) {
    var eventSources = {
        url: calendarUrl + '/' + resourceId,
        type: 'GET',
        error: function (ex) {
            alert(ex.message);
        },
        //beforeSend: function (ex) {
        //    $("li#" + resourceId + " div.floatClose img.loading").fadeIn('slow');
        //}
        //            ,
        //success: function () {
        //    $("li#" + resourceId + " div.floatClose img.loading").fadeOut('slow');
        //},
        color: colour,
        fillcolumn: fillcolumn
    };

    $('#calendar').fullCalendar('renderEvent', eventSources);
}

function UpdateCalendarToDate() {
    var dateSplit = $(".Search_Date").val().split("/");
    if (dateSplit.length == 3) {
        $('#calendar').fullCalendar('gotoDate', dateSplit[2], (dateSplit[1]-1), dateSplit[0]);
    }
}

function GetBuildingId(){
    return $("#Search_BuildingId").val()
}

// Renders room selection list for current building
function UpdateRoomsForBuilding() {
    $.ajax({
        url: dataUrl,
        data: { building: GetBuildingId() },
        success: function (j) {
            buildingRooms = j;
            RenderRoomsList(j);
        }
        //success: function (j) {
        //    var listItems = "";
        //    for (var i = 0; i < j.length; i++) {
        //        var colour = GetNextColour();
        //        listItems = CreateCalendarViewStub(j[i].value, j[i].label, colour);
        //        $("#listOfRooms").append(listItems);
        //        AssignOnClickCode(j[i].value, colour);
        //    }
        //    CheckRoomsIfPreClicked();
        //}
    });
}

// Renders building rooms as a radio button selection list
function RenderRoomsList(roomItems) {
    var roomMarkup = '<table class="selection-list">';
    for (var i = 0; i < roomItems.length; i++) {
        roomMarkup += '<tr><td><input type="radio" name="roomSelection" class="roomSelection" id="rb_' + roomItems[i].value + '" value="' + roomItems[i].value + '"></td><td><label for="rb_' + roomItems[i].value + '">' + roomItems[i].label + '</label></td></tr>';
    }
    roomMarkup += '</table>';
    $('#listOfRooms').html(roomMarkup);
}


//function CheckRoomsIfPreClicked() {
//    if (rooms) {
//        for (var room in rooms) {
//            var resourceId = rooms[room];
//            var listItem = $("li#" + resourceId);
//            var colour = listItem.children(".itemVisible").css("background-color");
            
//            RoomCheckboxChecked(listItem, resourceId, colour);   
//        }
//        delete room;
//    }
//}

function UpdateOpenCloseTimesForBuilding() {
    var colourGrey = '#6D6D6D';
    var buildingId = $("#Search_BuildingId").val();
    $("#buildingOpenClose").html(CreateCalendarViewStub(buildingId, "Opening Times", colourGrey));

    var listItem = $("li#" + buildingId);
    listItem.bind('click', function () {
        BuildingOpenCloseOnClick(listItem, colourGrey, buildingId);
    });

    // run once to set to load as default and setup correctly
    BuildingOpenCloseOnClick(listItem, colourGrey, buildingId);
}

function BuildingOpenCloseOnClick(listItem, colourGrey, buildingId) {
    if (!listItem.hasClass("added")) {
        AddCalendarItem(buildingId, colourGrey, buildingCalUrl, true);
        CheckListItems(listItem);
    }
    else {
        RemoveCalendarItem(buildingId, buildingCalUrl);
        ClearListItems(listItem)
    }
}

function CheckListItems(listItem) {
    listItem.addClass("added");
    var c = listItem.children("div.floatClose").children("input.checkbox");
    c.attr("checked", "checked");
}

function ClearListItems(listItem) {
    listItem.removeClass("added");
    var c = listItem.children("div.floatClose").children("input.checkbox");
    c.removeAttr("checked");
}

function RoomCheckboxChecked(listItem, resourceId, colour) {
    AddCalendarItem(resourceId, colour, calendarUrl, false);
    CheckListItems(listItem);
}

function RoomCheckboxUnchecked(listItem, resourceId) {
    RemoveCalendarItem(resourceId, calendarUrl);
    ClearListItems(listItem);
}

function AddCheckboxToFragment(resourceId) {
    var rooms = $.bbq.getState("checkedRooms");
    if (!rooms)
        rooms = new Array();

    rooms.push(resourceId);
    var roomsArray = { checkedRooms: rooms };
    $.bbq.pushState(roomsArray);
}

function RemoveCheckboxFromFragment(resourceId) {
    var rooms = $.bbq.getState("checkedRooms");

    for (var i = rooms.length - 1; i >= 0; i--) {
        if (rooms[i] === resourceId)
            rooms.splice(i, 1);
    }

    var roomsArray = { checkedRooms: rooms };
    $.bbq.pushState(roomsArray);
}

function AssignOnClickCode(resourceId, colour) {
    var listItem = $("li#" + resourceId);
    listItem.bind('click', function () {
        if (!listItem.hasClass("added")) {
            RoomCheckboxChecked(listItem, resourceId, colour);
            // Ideal this would be a call back but just hardcoding for now
            AddCheckboxToFragment(resourceId);
        }
        else {
            RoomCheckboxUnchecked(listItem, resourceId);
            RemoveCheckboxFromFragment(resourceId);
        }
    });
}

function ValidateForm(event) {
//    var validation = $("#RoomBookingPopup").find("form").validate({
//        rules: {
//            namebleh: {
//                CRC: true
//            }
//        }
//    });

//    $(".CustomRoomCheck").rules("add", {
//        "ConfirmationViewModel.ResourceId": "CustomRoomCheck"
//    });

//    if (validation.valid()) {
//        return true;
//    }
//    else {
//        validation.showErrors();
//        event.cancelBubble = true; // dont want to submit form
//        event.returnValue = false;
//        if (event.stopPropagation) {
//            event.stopPropagation();
//            event.preventDefault();
//        }
        return false;
//    }
}

var dataUrl = "";
var calendarUrl = "";
var buildingCalUrl = "";
var roomAvailURL = "";
var rooms

$.validator.setDefaults({ ignore: [] });

function RoomCalenderBegin(durl, curl, bcurl, aurl, roomsInc) {
    dataUrl = durl;
    calendarUrl = curl;
    buildingCalUrl = bcurl;
    roomAvailURL = aurl;
    rooms = roomsInc;

    if (calendarExist) {
        $('#calendar').fullCalendar('destroy');
    }

    CreateCalendar();
        
    $(".Search_Date").bind("change", function () {
        UpdateCalendarToDate();
    });

    $.validator.addMethod("CRC", function (value) {
        var selected = $("#Rooms").find("#rm_" + value).attr("disabled");
        var toReturn = selected !== 'disabled';
        return toReturn;
        },
        "Selected room is unavilable.\n\nPlease select another");

    $.validator.addClassRules("customRoomCheck", { CRC: true });

    calendarExist = true;

    UpdateRoomsForBuilding();
    UpdateOpenCloseTimesForBuilding();

    $("#CurrentEventSources").fadeIn();
}

var ajaxComplete;
var selectBoxComplete;
var avilableRoomStore;
var ajaxCall;

function UpdateSelectBox() {
    SetAllRoomToUnavialble();
    SetUpdateText("Updating Rooms");
    for(var roomId in avilableRoomStore.roomIds)
    {
        var item = "option#rm_" + avilableRoomStore.roomIds[roomId];
        var htmlItem = $(item);

        htmlItem.removeAttr("disabled");
    };

    $('select#Rooms').selectmenu(
    {
        refresh: true,
        format: addressFormatting
    });
    $('select#Rooms').selectmenu('enable');

    SetUpdateText("Done...");

    HideUpdateLoadingInfo();
}

// Display information for selected room
function UpdateRoomSelection() {

    SetUpdateText('Updating room...');
    $('#ConfirmationViewModel_ResourceId').val(selectedRoom);
    $('#room-display').html(selectedRoomName);

    SetUpdateText("Done...");

    HideUpdateLoadingInfo();

}

function SetAllRoomToUnavialble() {
    $('#Rooms').find("option").attr("disabled", "disabled");
    
    $('select#Rooms').selectmenu(
    {
        refresh: true,
        format: addressFormatting
    });
}

function ShowUpdateLoadingInfo() {
    $('#RoomUpdateLoader').fadeIn();
}

function HideUpdateLoadingInfo() {
    $('#RoomUpdateLoader').fadeOut();
}

function SetUpdateText(message) {
    $('#RoomUpdateLoader span#UpdateMessage').fadeOut().html(message).fadeIn();
}

// Shows popup information when user has selected calendar period
function ShowNewEventPopup(startDate, endDate) {

    ajaxComplete = false;
    selectBoxComplete = false;
    avilableRoomStore = "";

    ShowUpdateLoadingInfo();
    SetUpdateText("Checking room...");

    if (ajaxCall)
        ajaxCall.abort();
    
    var postData = {
        //buildingId: GetBuildingId(),
        buildingId: selectedRoom,
        start: $.fullCalendar.formatDate(startDate, "dd MMM yyyy HH:mm:ss"),
        end: $.fullCalendar.formatDate(endDate, "dd MMM yyyy HH:mm:ss")
    };

    ajaxCall = $.ajax({
        url: roomAvailURL,
        data: postData,
        success: function (data) {
            ajaxComplete = true;
            avilableRoomStore = data;

            if (selectBoxComplete) {
                //UpdateSelectBox();
                if (data.roomIds.length == 0) {
                    closePopup();
                    alert('Sorry, this room cannot be booked by you.\n\nPlease try another room.');
                    RemoveCalendarItem(selectedRoom, calendarUrl);
                } else {
                    UpdateRoomSelection();
                }
            }
        }
    });


    var roomsHTML = $("#CurrentEventSources #listOfRooms").children();
    var rooms = [];

    roomsHTML.each(function (index) {
        resource = $(this).attr('id');
        name = $(this).children(".roomName").text();
        colour = $(this).children(".itemVisible").css("background-color");

        rooms.push({
            roomId: resource,
            roomColour: colour,
            roomName: name
            });
    });

    $('div#RoomBookingPopup select#Rooms').html("");
    $('#ConfirmationViewModel_ResourceId').val("");
    $(".validation-summary-errors")
        .removeClass("validation-summary-errors")
        .addClass("validation-summary-valid");

    $('.field-validation-error')
        .removeClass('field-validation-error')
        .addClass('field-validation-valid');

    $('.input-validation-error')
        .removeClass('input-validation-error')
        .addClass('valid');

    $.each(rooms, function (index, item) {
        $('div#RoomBookingPopup select#Rooms').append(CreateSelectableRoom(item, index))
    });
    
    $('select#Rooms').selectmenu(125);
    $('select#Rooms').selectmenu(
    {
        refresh: true,
        format: addressFormatting
    });
    $('select#Rooms').selectmenu('disable');

    selectBoxComplete = true;
    if (ajaxComplete)
        //UpdateSelectBox();
        UpdateRoomSelection();

    //need to populate time and other rubbish
    var dateString = $.fullCalendar.formatDate(startDate, "dddd, d MMMM yyyy");
    $("#RoomBookingDate").text(dateString);

    var timeString = $.fullCalendar.formatDate(startDate, "HH:mm") + " to " + $.fullCalendar.formatDate(endDate, "HH:mm");
    $("#RoomBookingTime").text(timeString);

    $("#ConfirmationViewModel_StartTime").val($.fullCalendar.formatDate(startDate, "dd/MM/yyyy HH:mm:ss"));
    $("#ConfirmationViewModel_EndTime").val($.fullCalendar.formatDate(endDate, "dd/MM/yyyy HH:mm:ss"));

    UpdateResourceIdToSelected();

    // display make booking box
    centerPopup();
    loadPopup();
}

var addressFormatting = function (text) {
    var newText = text;

    if (text !== " -- Select Room -- ") {
        var resultString = '<div class="itemVisible" style="background-color:$1;width:16px;height:16px;"></div>';

        // I like this function but it dosn't work with IE!!!!
        //newText = newText.replace(/^\[colour:(rgb\(\d{1,3},.?\d{1,3},.?\d{1,3}\))\]/g, resultString);

        newText = newText.replace(/^\[colour:(.+)\]/g, resultString);

        return newText;
    }
    else return '<div></div>';
}

function CalendarMouseOut(event, jsEvent, view) {
    $('#listOfRooms').find('li.highlightHover').removeClass("highlightHover");
//    $(jsEvent.target).parent().width(savedWidth);
}

function CalendarMouseIn(event, jsEvent, view) {
    var resourceId = event.resourceId;
    $('#listOfRooms').find('li#' + resourceId).addClass("highlightHover");

    

//    savedWidth = $(jsEvent.target).width();
//    $(jsEvent.target).parent().width("auto");
}

function CreateCalendar() {
    var height = parseInt($("#roomBookingCalendarContainer").css("height"), 10) - 75;
        
    // the date is reset by the functions in calendar.
    var date = $(".Search_Date").val();

    $(".unknown").fadeOut();

    $('#calendar').fullCalendar({
        header: {
            left: 'prev,next today',
            center: 'title',
            //right: 'basicDay ,agendaWeek,agendaDay'
            right: 'agendaWeek,agendaDay'
        },
        firstDay: 1,
        defaultView: 'agendaWeek',
        allDaySlot: false,
        contentHeight: height,
        windowResize: function (view) {
            var height = parseInt($("#roomBookingCalendarContainer").css("height"), 10) - 75;
            $(this).fullCalendar('option', 'contentHeight', height);
        },
        columnFormat: "dddd d, MMM yyyy",
        titleFormat: {
            month: "MMMM yyyy",
            week: "dddd, d MMMM [ yyyy]{ '-' dddd d, MMMM yyyy}",
            day: "dddd, d MMMM yyyy"
        },
        viewDisplay: function (view) {
            var newDate = $('#calendar').fullCalendar('getDate');
            $(".Search_Date").val($.fullCalendar.formatDate(newDate, "dd/MM/yyyy"));
        },
        buttonText:
        {
            today: 'Today',
            month: 'Month',
            week: 'Week',
            day: 'Day'
        },
        timeFormat: 'H:mm{ - H:mm}',
        axisFormat: 'H:mm',
        selectable: true,
        selectHelper: true,
        select: function (startDate, endDate, allDay, jsEvent, view) {
            if (!selectedRoom) {
                alert('Please select a room first');
                return false;
            }

            if (!allDay) {
                ShowNewEventPopup(startDate, endDate);
            }
            else {
                $('#calendar').fullCalendar('unselect');
            }
        },
        eventMouseover: function (event, jsEvent, view) {
            CalendarMouseIn(event, jsEvent, view);
        },
        eventMouseout: function (event, jsEvent, view) {
            CalendarMouseOut(event, jsEvent, view);
        }
    });

    $("#Rooms").live("change", function () {
        UpdateResourceIdToSelected();
    });

    $(".Search_Date").val(date);
    UpdateCalendarToDate();
}

function UpdateResourceIdToSelected() {
    var val = $("#Rooms").val();
    $("#ConfirmationViewModel_ResourceId").val(val);
}

function CreateSelectableRoom(room) {
    var toReturn = "";
    toReturn += '<option id="rm_' + room.roomId + '" value="' + room.roomId + '">';
    toReturn += '[colour:' + room.roomColour + ']';
    toReturn += room.roomName;
    toReturn += '</option>';

    return toReturn;
}