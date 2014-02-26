/*
Core functionality for touch screen desk bookings
Jeremy Page: April 2013

Additional plugins etc.:
moment.js - easier date/time handling
handlebars - JSON->HTML templating
jQM-DateBox2 - Popup calendar
keyboard - on-screen keyboard for login
*/

var loginId;
var openId;
var userName;
// TODO: Stop using the same params variable everywhere to avoid clashes
var params;
var selectedDesk;
var zoneName;

// Set timeouts for closing or reloading pages
var INACTIVITY_TIMEOUT = 60 * 1000;  // Inactivity timeout (milliseconds)
var DIALOG_TIMEOUT = 10 * 1000; // Dialog timeout

// Constants for times
var START_OF_DAY = 7;
var LUNCH_BREAK = 13;
var END_OF_DAY = 19;

var bookingTimeStart;
var bookingTimeEnd;
var bookingDateTimeStart;
var bookingDateTimeEnd;


// General jQuery functions
$().ready(function () {

    // Render the on-screen keyboard
    RenderKeyboard();

    // Capture the date returned by datebox
    $('#datetimeDate').bind('datebox', function (e, data) {
        if (data.method === 'set') {
            bookingDateTimeStart = moment(data.value, 'DD\MM\YYYY').hours(bookingTimeStart).minutes(0).seconds(0);
            bookingDateTimeEnd = moment(data.value, 'DD\MM\YYYY').hours(bookingTimeEnd).minutes(0).seconds(0);
        }
    });

    // Capture time selection changes
    $('input[name="radio-datetime"]').bind('change', function () {
        switch ($(this).val()) {
            case 'DAY':
                bookingTimeStart = START_OF_DAY;
                bookingTimeEnd = END_OF_DAY;
                break;
            case 'AM':
                bookingTimeStart = START_OF_DAY;
                bookingTimeEnd = LUNCH_BREAK;
                break;
            case 'PM':
                bookingTimeStart = LUNCH_BREAK;
                bookingTimeEnd = END_OF_DAY;
                break;
        }
        bookingDateTimeStart = bookingDateTimeStart.hours(bookingTimeStart).minutes(0).seconds(1);
        bookingDateTimeEnd = bookingDateTimeEnd.hours(bookingTimeEnd).minutes(0).seconds(0);
    });

    // Capture zone list selection clicks
    $('#zoneList').on('click', 'a', function (e) {
        params = $(e.target).jqmData('params');
        zoneName = $(e.target).jqmData('zone');
        $('.nav-zone').text(zoneName);
    });

    // login checks
    $('#login-submit').tap(function () {
        DoLogin();
    });

    // Process desk booking when user selects 'submit'
    $('.submit-desk').tap(function () {
        BookDesk();
    });

    // Delete currently displayed booking (no confirmation given)
    $('#delete-booking').tap(function () {
        DeleteDeskBooking();
    });

    RegisterHandlebarsHelpers();

    // Zone information doesn't change (much), so render immediately
    RenderZoneInfo();

});


// Page initialisations
$(document).bind("pageinit", function (event) {

    // Is this needed?
    $.mobile.pageLoadErrorMessage = 'Whoops!';

    // Capture 'My bookings' list clicks
    $('#bookingList').on('click', 'a', function (e) {
        params = $(e.target).jqmData('params');
    });

    // Capture desk list selection changes
    $('#deskList').on('change', 'input[type="radio"]', function () {
        selectedDesk = $(this).val();
        $('.submit-desk').button('enable');
    });

});


// What to do before every page change
$(document).bind('pagebeforechange', function (event, data) {

    $.mobile.loading('show', { text: 'Please wait...', textVisible: true });

    // Get the pages we have moved to/from
    var to = data.toPage,
        from = data.options.fromPage;

    // Movement  between JQM pages uses uses strings (e.g. #pagename)
    if (typeof to == 'string') {

        var html;

        var u = $.mobile.path.parseUrl(to);
        to = u.hash || '#' + u.pathname.substring(1);
        if (from) from = '#' + from.attr('id');

        if (to == '#page-login') {
            // Clear the payroll field on the login screen
            $('#login-id').val('');
        }

        // If we're going anywhere except the login page, check that we have a valid user login
        if (to != '#page-login' && !loginId) {
            $.mobile.changePage($('#page-login'));
            $('#login-message').html('');
            event.preventDefault();
        }

        // When moving to the existing bookings page
        if (to == '#page-bookings') {
            RenderMyBookings();
        }

        // When moving to desk selection list page
        if (to == '#page-desk') {
            RenderDesks();
        }

        // When moving to the booking information page
        if (to == '#page-booking-info') {
            RenderBookingInfo();
        }

        // Clear the desk list when moving to another page
        if (from == '#page-desk') {
            $('#deskList').html('');
        }

    }

});


// What to do after every page change is complete
$(document).bind('pagechange', function (event, data) {
    ResestTimeout();
    $.mobile.loading('hide');
});


// Reformat booking dates and times into something more user-friendly
function ReformatBookings(data) {
    // Reformat the booking dates (e.g. 'Monday, 1st January')
    for (var i = 0; i < data.BookingDates.length; i++) {
        var bookingDate = data.BookingDates[i];
        var bookingDateMoment = moment(bookingDate.Date);
        if (moment().isSame(bookingDateMoment, 'day')) {
            data.BookingDates[i].Date = 'Today';
        } else {
            data.BookingDates[i].Date = bookingDateMoment.format('dddd, Do MMMM');
        }
        // Reformat the booking times (e.g. '7 am')
        for (var b = 0; b < bookingDate.DeskBookings.length; b++) {
            bookingDate.DeskBookings[b].Start = moment(bookingDate.DeskBookings[b].Start).format('ha');
            bookingDate.DeskBookings[b].Finish = moment(bookingDate.DeskBookings[b].Finish).format('ha');
        }
    }
}

// Book a desk with the currently supplied data
function BookDesk() {
    $.getJSON(makeBookingUrl, {
        ResourceId: selectedDesk,
        id: loginId,
        Start: moment(bookingDateTimeStart).utc().toJSON(),
        End: moment(bookingDateTimeEnd).utc().toJSON()
    }, function (data) {
        if (data.status != 'OK') {
            $('<div class="ui-loader ui-overlay-shadow ui-body-e ui-corner-all"><h1>' + data.status + '</h1></div>')
          .css({ 'display': 'block', 'opacity': 0.96, 'top': $(window).scrollTop() + 100 })
          .appendTo($.mobile.pageContainer)
          .delay(800)
          .fadeOut(400, function () {
              $(this).remove();
          });
        } else {
            params = data.bookingRef;
            RenderBookingInfo();
            $.mobile.changePage($('#page-booking-info'));
        }
    });
}


// Display all user's current bookings on screen
function RenderMyBookings() {

    // IE insists on caching AJAX calls, so add dummy [foobar] data to force a fresh query every time
    $.getJSON(userDataUrl, { id: loginId, includeFutureDays: 28, foobar: new Date() }, function (data) {

        ReformatBookings(data);

        // Format JSON using handlebars.js
        var bookingListTemplate = Handlebars.compile($('#booking-list-template').html());
        $('#bookingList').html(bookingListTemplate(data));
    })
    .complete(function () {
        // trigger a content refresh
        $('#page-bookings').trigger('create');
        // Hide any loading messages
        $.mobile.loading('hide');
    });

}


// Display current booking information on screen
function RenderBookingInfo() {
    $.getJSON(bookingDataUrl, { id: params }, function (data) {

        // Make times more user friendly
        data.Start = moment(data.Start).format('dddd, Do MMMM ha');
        data.End = moment(data.End).format('ha');

        // Format JSON using handlebars.js
        var bookingInfoTemplate = Handlebars.compile($('#booking-info-template').html());
        $('#bookingInfo').html(bookingInfoTemplate(data));
    })
    .complete(function () {
        // trigger a content refresh
        $('#page-booking-info').trigger('create');
    });
}

// Prepare all important stuff for logged in user
function PrepUser(user) {
    //$.mobile.loading('show', { text: 'Please wait...', textVisible: true });
    openId = user.OpenId;
    userName = user.FirstName + " " + user.Surname;
    RenderMyBookings();
    $.mobile.changePage($('#page-bookings'));
    // Set default times etc. for the user
    ResetTimes();
}

// Reset dates & times back to default
function ResetTimes() {

    bookingTimeStart = START_OF_DAY;
    bookingTimeEnd = END_OF_DAY;
    bookingDateTimeStart = moment().hours(START_OF_DAY).minutes(0).seconds(0);
    bookingDateTimeEnd = moment().hours(END_OF_DAY).minutes(0).seconds(0);

    // Set the date picker to today's date. Can this be done in markup?
    $('#datetimeDate').val(moment.utc().format('DD[\\]MM[\\]YYYY'));
}


// Resets the timeout on every page change
function ResestTimeout() {
    if (typeof timeout_counter != 'undefined') window.clearTimeout(timeout_counter);
    switch ($.mobile.activePage[0].id) {
        case 'page-login':
            // Do not restart timeout on login page
            break;
        case 'page-booking-info':
            timeout_counter = window.setTimeout(function () { $.mobile.changePage($('#page-bookings')); }, DIALOG_TIMEOUT);
            break;
        default:
            timeout_counter = window.setTimeout(function () {
                window.location.href = deskTouchUrl;
            }, INACTIVITY_TIMEOUT);
    }
}


// Perform login checks etc.
function DoLogin() {
    $('#login-form').validate({
        submitHandler: function (form) {
            $.mobile.loading('show', { text: 'Please wait...', textVisible: true });
            loginId = $('#login-id').val().toUpperCase();
            // Reload entire page if user enters the 'magic code'
            if (loginId == '999') {
                window.location.href = deskTouchUrl;
            }
            $.getJSON(loginCheckUrl, { id: loginId }, function (data) {
                if (data.error) {
                    $('#login-message').html(data.error);
                } else {
                    PrepUser(data.user);
                }
            })
            .complete(function () {
                $.mobile.loading('hide');
            });
        }
    });
}


// Sets up the on-screen keyboard
function RenderKeyboard() {
    $('#login-id').keyboard({
        usePreview: false,
        position: {
            at: 'center bottom',
            of: $('.keyboard-anchor')
        },
        autoAccept: true,
        //keyBinding: 'mousedown touchstart',
        display: {
            "enter": '\u21b5'
        },
        css: {
            input: '',
            container: '',
            buttonDefault: '',
            buttonHover: '',
            buttonActive: '',
            buttonDisabled: ''
        },
        layout: 'custom',
        customLayout: {
            'default': ['1 2 3 4 5 6 7 8 9 0 - {bksp}', 'Q W E R T Y U I O P', 'A S D F G H J K L', '{cancel} Z X C V B N M {accept}']
        }
    })
    .addMobile({
        // keyboard wrapper theme
        container: { theme: 'a' },
        // theme added to all regular buttons
        buttonMarkup: { theme: 'a', shadow: 'true', inline: 'true', corners: 'false' },
        // theme added to action buttons (e.g. tab, shift, accept, cancel);
        // parameters here will override the settings in the buttonMarkup
        buttonAction: { theme: 'b' },
        // theme added to button when it is active (e.g. shift is down)
        // All extra parameters will be ignored
        buttonActive: { theme: 'e' }
    });
}

// Additional helper function(s) for use with Handlebars templating plugin
function RegisterHandlebarsHelpers() {

    // Handlebar helper function to render desk radio button selection dependent on availability
    Handlebars.registerHelper('availableDesk', function (desk) {

        // Define the templates first
        var deskBookableTemplate = Handlebars.compile($('#desk-bookable-subtemplate').html());
        var deskUnbookableTemplate = Handlebars.compile($('#desk-unbookable-subtemplate').html());
        var deskOccupiedTemplate = Handlebars.compile($('#desk-occupied-subtemplate').html());

        // If data shows an occupant for this data then show their name(s)
        if (desk.Occupants.length != 0) return new Handlebars.SafeString(deskOccupiedTemplate(desk));

        // If data shows desk as unbookable (e.g. class A) then show as unavailable
        if (desk.Bookable == false) return new Handlebars.SafeString(deskUnbookableTemplate(desk));

        // Otherwise return normal radio button selector
        return new Handlebars.SafeString(deskBookableTemplate(desk));
    });

}

// Display floor and zone names list
function RenderZoneInfo() {
    // Zone information doesn't change (much), so render immediately
    $.getJSON(zoneDataUrl, function (data) {
        // Prepare the Handlebars template from
        var zoneListTemplate = Handlebars.compile($('#zone-list-template').html());
        $('#zoneList').html(zoneListTemplate(data));
    });
}


// Delete desk booking (specified by booking id params)
function DeleteDeskBooking() {
    if (params != '') {
        $.getJSON(deleteBookingUrl, { BookingId: params, id: loginId }, function (data) {
            // Attempt to show alert if booking deletion failed
            if (data.status != 'OK') {
                $('<div class="ui-loader ui-overlay-shadow ui-body-e ui-corner-all"><h1>' + data.status + '</h1></div>')
              .css({ 'display': 'block', 'opacity': 0.96, 'top': $(window).scrollTop() + 100 })
              .appendTo($.mobile.pageContainer)
              .delay(800)
              .fadeOut(400, function () {
                  $(this).remove();
              });
            } else {
                RenderMyBookings();
                $.mobile.changePage($('#page-bookings'));
            }
        });
    }
}


// Displays all desk info for given zone
function RenderDesks() {
    $.getJSON(deskDataUrl, {
        id: loginId,
        start: bookingDateTimeStart.toJSON(),
        end: bookingDateTimeEnd.toJSON(),
        zone: params
    }, function (data) {
        if (data.Desks.length < 1) {
            html = '<h1 class="very-large centered">No desks are available in this zone</h1>';
        } else {
            // Rationalise the occupants names
            for (var i = 0; i < data.Desks.length; i++) {
                if (data.Desks[i].Occupants.length > 1) data.Desks[i].Occupants = ["Multiple occupants"];
            }

            // Format JSON using handlebars.js
            var deskListTemplate = Handlebars.compile($('#desk-list-template').html());
            html = deskListTemplate(data);
        }
        // Output HTML to DOM
        $('#deskList').html(html);
    })
    .complete(function () {
        // disable the 'submit' button on the desk selection page
        $('.submit-desk').button('disable');

        // trigger a content refresh
        $('#page-desk').trigger('create');
    });

}