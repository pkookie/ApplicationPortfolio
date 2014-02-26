var AddItemToBookingURL = ""; //'@Url.Action("AddTextItemToBooking")'
var AddProfileToBookingURL = "";  //'@Url.Action("AddProfileIdToBooking")'
var AjaxLoaderURL = ""; //@Url.Content("~/Content/Images/ajax-loader.gif")
var SearchAttendeesAjaxURL = ""; //'@Url.Action("SearchAttendees", "Room")'
var RemoveProfileAjaxURL = "";

function addEmailToBooking(item) {
    var email = $(item).children("#emailString").val();
    makeStringCallBack(email, email);
}

function addStringInfoToBooking(item) {
    var name = $(item).children("#stringValue").val();
    makeStringCallBack("", name);
}

function addNoneProfileToBooking(selected, type, bookingId) {
    var dataObject = { bookingId: bookingId, selected: selected, type: type };

    $.post(AddItemToBookingURL, dataObject, function (data) {
        $('#AddAttendees').val("");
        $('#AddAttendeesResults').fadeOut();
        $('.noAttendeesInformation').fadeOut();
        $("#NoneTraffordAttendeeContainer").hide().html(data).fadeIn();
    });
}

function addOpenIdToBooking(profileId, bookingId) {
    if (!DoesProfileExist(profileId)) {
        var sendObject = { profileId: profileId, bookingId: bookingId };

        $.post(AddProfileToBookingURL, sendObject, function (data) {
            HideAttendeeSearchResults();
            $("#TraffordAttendeeContainer").hide().html(data).fadeIn();
        });
    }
    else {
        HideAttendeeSearchResults();
        FlashProfile(profileId);
    }
}

function HideAttendeeSearchResults() {
    $('#AddAttendees').val("");
    $('#AddAttendeesResults').fadeOut();
    $('.noAttendeesInformation').fadeOut();
}

function DoesProfileExist(profileId) {
    var itemIds = $('#TraffordAttendeeContainer').find('.ViewId');

    for(i = 0; i < itemIds.length; i++)
    {
        var value = $(itemIds[i]).val();
        if (value == profileId) {
            return true;
        }
    }

    return false;
}

function FlashProfile(profileId) {
    var itemIds = $('#TraffordAttendeeContainer').find('.ViewId');

    for (i = 0; i < itemIds.length; i++) {
        var value = $(itemIds[i]).val();
        if (value == profileId) {
            var item = $(itemIds[i]).parent();
            var backgroundColour = item.css("background-color");
            var borderColour = item.css("border-left-color");

            item.css("background-color", "#B9B9B9");
            item.css("border-color", "#A05050");

            item.animate({
                backgroundColor: backgroundColour,
                borderTopColor: borderColour,
                borderRightColor: borderColour,
                borderLeftColor: borderColour,
                borderBottomColor: borderColour
            },
                           2000);
        }
    }       
}

function RemoveAttendeeFromProfile(item) {
    var parent = $(item.target).parent();
    var stubBox = parent.children(".stubBox");
    var id = stubBox.children(".ViewId").val();
    var type = stubBox.children(".ItemType").val();
    
    var bookingId = $('#ConfirmationViewModel_BookingId').val();

    if (type == "Profile")
        type = "profileId";
    else if (type == "NoneProfileAttendee")
        type = "id";

    var sendObject = { id: id, bookingId: bookingId, type: type };

    $.post(RemoveProfileAjaxURL, sendObject, function (data) {
        if (type == "id") {
            // The ids of the none profiles will have been updated
            // the data is the new list to display
            $("#NoneTraffordAttendeeContainer").hide().html(data).fadeIn();
        }
        else {
            $(item.target).parent().fadeOut(400,function () {
                $(item.target).parent().remove();
                HideAttendeesIfEmpty();
            });
        }
    });
}

function HideAttendeesIfEmpty() {
    var noneTraffordHasItems = ($("#NoneTraffordAttendeeContainer").find(".stubBox").length > 0)
    var traffordHasItems = ($("#TraffordAttendeeContainer").find(".stubBox").length > 0);

    if (!noneTraffordHasItems) {
        $(".noneTraffordAttendees").fadeOut();
    }

    if (!traffordHasItems) {
        $(".traffordAttendees").fadeOut();
    }

    if (!traffordHasItems && !noneTraffordHasItems) {
        $(".noAttendeesInformation").fadeIn();
    }
}

function SubmitFirstResultObject() {
    $("#AddAttendeesResults").children("li:first").click();
}

function addProfileToBooking(item) {
    var type = $(item).children(".ItemType").val();
    var bookingId = $('#ConfirmationViewModel_BookingId').val();

    if (type == "Profile") {
        var profileId = $(item).children(".ViewId").val();
        addOpenIdToBooking(profileId, bookingId);
    }
    else if (type == "String" || type == "Email") {
        var string = $("#AddAttendees").val();
        addNoneProfileToBooking(string, type, bookingId);
    }
}

var xhr;
var timeout = 150;
var timeoutAction;

function LoadAttendeesCode() {
    var AutoSearchLoading = '<li id="ajax_loader"><img src="' + AjaxLoaderURL + '" /> Searching...</li>';

    $("#BigAddImage").live("click", debounce(function () {
                if ($("#AddAttendees").val() == "") {
                    $("#AddAttendees").select();
                }
                else {
                    SubmitFirstResultObject();
                }
    }));

    $('#AddAttendees').watermark("Search..");
    $('#AddAttendees').keyup(function (event) {
        if (event.keyCode == 40) {
            // down pressed
            MoveToNextSelection();
        }
        else if (event.keyCode == 38) {
            // up pressed
            MoveToPreviousSelection();
        }
        else if (event.keyCode == 13) {
            // Enter pressed
            SelectSelectedItem();
        }
        else if (event.keyCode == 27) {
            ClearSelection();
        }
        else {
            $('#AddAttendeesResults').html(AutoSearchLoading);
            var searchString = $('#AddAttendees').val();

            if (searchString != "") {
                $('#AddAttendeesResults').fadeIn();

                clearTimeout(timeoutAction);
                timeoutAction = setTimeout(function () {

                    if (xhr) {
                        xhr.abort();
                    }

                    var searchObject = { searchString: searchString };

                    xhr = $.ajax({
                        url: SearchAttendeesAjaxURL,
                        type: 'POST',
                        data: searchObject,
                        success: function (data) {
                            $('#AddAttendeesResults').html(data);
                            $('#AddAttendeesResults').find("a").click(function (e) {
                                e.preventDefault();
                            });
                            SetFirstItemAsSelected();
                            $('#AddAttendeesResults').find('.stubBox').click(function () { addProfileToBooking(this) });
                            $('#AddAttendeesResults').find('.stubBox').hover(function () { SetItemToSelected(this) });
                        }
                    });
                }, timeout);
            }
            else {
                ClearSelection();
            }
        }
    });
       

    $('.removeProfile').live("click", function (item) {
        RemoveAttendeeFromProfile(item);
    });

    $('.iconHover').live("mouseenter", function () {
        var previtem = $(this).parent().prev();
        var widthToo = previtem.children(".iconsDispalyHidden").outerWidth();

        previtem.animate({ width: widthToo, marginLeft: (0 - widthToo) });
    });
    $('.iconHover').live("mouseleave", function () {
        var previtem = $(this).parent().prev();
        var widthToSave = previtem.children(".iconsDispalyHidden").outerWidth();
        var widthToo = 0;

        previtem.animate({ marginLeft: widthToo, width: widthToo });
        previtem.children(".iconsDispalyHidden").animate({ width: widthToSave });
    });

    $('.removeProfile').live("mouseenter", function (event) {
        HighlightProfileTab(event.target);
    });

    $('.removeProfile').live("mouseleave", function (event) {
        RemoveAllProfileHighlights();
    });
}

function HighlightProfileTab(item) {
    $(item).parent().addClass("highlightedProfile");
}

function RemoveAllProfileHighlights() {
    $('.highlightedProfile').removeClass("highlightedProfile");
}

function ClearSelection() {
    $('#AddAttendees').val("");
    $('#AddAttendeesResults').fadeOut();
    $('.addAttendees').fadeOut();
}

function SelectSelectedItem() {
    var location = $('#AddAttendeesResults').find("li.selected");
    location.children().click();
}

function SetFirstItemAsSelected() {
    var result = $('#AddAttendeesResults').children(":first");
    $(result).addClass("selected");
}

function MoveToNextSelection() {
    var location = $('#AddAttendeesResults').find("li.selected");
    var newLocation = location.next();

    if (newLocation.length > 0 && !newLocation.hasClass("unselectable")) {
        location.removeClass("selected");
        newLocation.addClass("selected");
    }
}

function MoveToPreviousSelection() {
    var location = $('#AddAttendeesResults').find("li.selected");
    var newLocation = location.prev();

    if (newLocation.length > 0 && !newLocation.hasClass("unselectable")) {
        location.removeClass("selected");
        newLocation.addClass("selected");
    }
}

function SetItemToSelected(item) {
    var location = $('#AddAttendeesResults').find("li.selected");
    location.removeClass("selected");

    $(item).parent().addClass("selected");
}