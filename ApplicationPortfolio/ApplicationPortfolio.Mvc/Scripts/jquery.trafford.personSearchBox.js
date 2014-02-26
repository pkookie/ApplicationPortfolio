// TODO:
// 1)   Give option of changing default behaviour when an item is selected
//      this should be a function which can be defined at initiation.
//      For the sake of code now, its hardcoded with default functionlaity
//      which will hide the text box and display the selected profile.


// Quick jQuery search hack type thing
(function ($) {
    $.fn.setSearchBox = function (options) {
        //Idealy would use this function to setup defaults etc however just going to jump stright into code


        var defaults = {
            ajaxTimeout: 150,
            searchUrl: "SearchAttendees",
            onSearchBoxSelect: function (item) {
                var itemType = item.find("#item_ItemType").val();
                var itemId = item.find("#item_ViewId").val();

                $("#ConfirmationViewModel_BookedFor").val(itemId);
                $("#ConfirmationViewModel_BookedForType").val(itemType);
            },
            onItemRemoved: function () {
                $("#ConfirmationViewModel_BookedFor").val("");
                $("#ConfirmationViewModel_BookedForType").val("");
            },
            replaceTextBoxWithSelectedItem: true,
            clearAllLinkDefaultBehaviour: true
        }

        // create object
        var searchBox = new setSerchBoxClass($(this[0]), defaults);
    }


    function setSerchBoxClass(element, options) {
        var t = this;

        var element = element;

        var resultBox;
        if (options.resultBox)
            resultBox = options.resultBox;
        else
            resultBox = createResultsList();
        var resultBoxVisible;
        var ajaxCallTimeout = options.ajaxTimeout;
        var searchUrl = options.searchUrl;
        var ajaxCall;
        var ajaxCallTimer;
        var replaceTextBoxWithSelectedItem = options.replaceTextBoxWithSelectedItem;

        var clearAllLinks = options.clearAllLinkDefaultBehaviour;

        var onSearchBoxSelect = options.onSearchBoxSelect;
        var onItemRemoved = options.onItemRemoved;

        element.click(function (event) { onClick(event); });
        element.keyup(function (event) { return onKeyPress(event); });
        element.keydown(function (event) { return preventSubmitionOnEnter(event); });
        element.watermark("Search...");

        $(".personSearchBox-imgRemove").live({
            mouseenter: function (event) { removeItemEntered(); },
            mouseleave: function (event) { removeItemLeft(); },
            click: function (event) { removeItemClicked(); }
        });

        // this shouldn't reference stub box simply because the results should be a list,
        // could be a list of anything not necessary stubbox's

        //        $("#personSearchBox-resultsList .stubBox").live({
        //            //hover: function (event) { resultItemEntered(event); },
        //            mouseenter: function (event) { resultItemEntered(event); },
        //            click: function (event) { resultItemClicked(event); }
        //        });


        function onClick(event) {
            if (element.val() !== "")
                element.select();
        }

        function onKeyPress(event) {
            switch (event.keyCode) {
                case 40: // down pressed
                    moveToNextSelection();
                    break;
                case 38: // up pressed
                    moveToPrevSelection();
                    break;
                case 13: // enter pressed
                    selectSelectedItem();
                    break;
                case 27: // escape pressed
                    clearSearchBox();
                    hideResultBox();
                    break;
                default: // Any key pressed!
                    search();
                    break;
            }
        }

        function moveToNextSelection() {
            var currentItem = resultBox.find("li.personSearchBox-selected");
            var newItem = currentItem.next();
            setItemAsSelected(newItem);
        }

        function moveToPrevSelection() {
            var currentItem = resultBox.find("li.personSearchBox-selected");
            var newItem = currentItem.prev();
            setItemAsSelected(newItem);
        }

        function setItemAsSelected(item) {
            // Select all and remove just as a precaution
            var currentItems = resultBox.find(".personSearchBox-selected");

            if (item.length > 0
            && !item.hasClass("personSearchBox-unselectable")
            && !item.hasClass("unselectable")) {
                currentItems.removeClass("personSearchBox-selected");
                item.addClass("personSearchBox-selected");
            }
        }

        function preventSubmitionOnEnter(event) {
            if (event.keyCode === 13) {
                event.cancelBubble = true; // dont want to submit form
                event.returnValue = false;
                if (event.stopPropagation) {
                    event.stopPropagation();
                    event.preventDefault();
                }
                return false;
            }
            else
                return true;
        }

        function setFirstItemAsSelected() {
            var item = resultBox.children(":first");
            setItemAsSelected(item);
        }


        //TODO: Fix this function.  It's tightly coupled to dom object and page its setup with.
        function selectSelectedItem() {
            var itemToSelect = resultBox.find(".personSearchBox-selected");

            if (itemToSelect.length > 0) {
                if (typeof onSearchBoxSelect === 'function')
                    onSearchBoxSelect(itemToSelect);

                clearSearchBox();
                hideResultBox();

                if (replaceTextBoxWithSelectedItem) {
                    hideProfileSelectTextbox();
                    addProfileToForm(itemToSelect.find(".stubBox"));
                    addRemoveOptionToSelectedItem();
                }
            }
        }

        function addProfileToForm(stub) {
            var divWrapper = $(document.createElement('div'));
            divWrapper.addClass("personSearchBox-itemWrapper");

            divWrapper.append(stub);
            element.parent().append(divWrapper);
        }

        function removeProfileFromFrom() {
            if (typeof onItemRemoved === "function")
                onItemRemoved();

            if (replaceTextBoxWithSelectedItem) {
                var toRemove = element.parent().find(".personSearchBox-itemWrapper");
                toRemove.remove();
                showProfileSelectTextbox();
            }
        }

        function hideProfileSelectTextbox() {
            element.hide();
        }

        function showProfileSelectTextbox() {
            element.show();
        }

        function addRemoveOptionToSelectedItem() {
            element.parent().find(".personSearchBox-itemWrapper").append('<div class="personSearchBox-removeItem"><img src="../Content/Icons/delete.png" class="personSearchBox-imgRemove" /></div>');
        }

        function clearSearchBox() {
            if (element.val() !== "")
                element.val("");
        }

        function search() {
            var searchString = element.val();

            clearAjaxCall();
            clearTimeout(ajaxCallTimer);

            if ((typeof searchString !== 'undefined') && searchString !== "") {
                showResultBoxLoader();
                showResultBox();
                ajaxCallTimer = createNewAjaxTimer(searchString);
            }
            else {
                hideResultBox();
            }

        }

        function clearAjaxCall() {
            if (ajaxCall)
                ajaxCall.abort();
        }

        function createNewAjaxTimer(searchString) {
            return setTimeout(function () {
                ajaxCall = $.ajax({
                    url: searchUrl,
                    type: 'POST',
                    data: { searchString: searchString },
                    success: function (data) {
                        ajaxCompleteCallback(data);
                        setFirstItemAsSelected();
                        setNewItemsEventFunctions();
                    }
                }),
                ajaxCallTimeout
            });
        }

        function ajaxCompleteCallback(data) {
            resultBox.html(data);
            if (clearAllLinks) {
                resultBox.find("a").click(function (e) {
                    e.preventDefault();
                });
            }
        }

        function setNewItemsEventFunctions() {
            resultBox.find('.stubBox').hover(function () { resultItemEntered(this); });
            resultBox.find('.stubBox').click(function () { resultItemClicked(this); });

            //            //hover: function (event) { resultItemEntered(event); },
            //            mouseenter: function (event) { resultItemEntered(event); },
            //            click: function (event) { resultItemClicked(event); }
            //        });
        }

        function showResultBoxLoader() {
            var loadingHtml = '<li id="personSearchBox-ajaxLoader"><img src="../Content/Images/ajax-loader.gif"> Searching...</li>';
            resultBox.html(loadingHtml);
        }

        function showResultBox() {
            if (!resultBoxVisible) {
                resultBox.show();
                resultBoxVisible = true;
            }
        }

        function hideResultBox() {
            if (resultBoxVisible) {
                resultBox.hide();
                resultBoxVisible = false;
            }
        }

        function createResultsList() {
            var htmlItem = '<ul id="personSearchBox-resultsList"></ul>';
            element.parent().append(htmlItem);
            return $("#personSearchBox-resultsList");
        }

        function removeItemEntered(event) {
            element.parent().find(".personSearchBox-itemWrapper").addClass("personSearchBox-itemWrapperHighlight");
        }

        function removeItemLeft(event) {
            element.parent().find(".personSearchBox-itemWrapper").removeClass("personSearchBox-itemWrapperHighlight");
        }

        function removeItemClicked(event) {
            removeProfileFromFrom();
        }

        function resultItemEntered(event) {
            setItemAsSelected($(event).parent("li"));
        }

        function resultItemClicked(event) {
            selectSelectedItem();
        }
    }
})(jQuery);