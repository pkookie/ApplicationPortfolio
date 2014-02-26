$(document).ready(function () {
    $(".galleryItem").hover(function () {
        $(this).find('img').animate({
            height: '138',
            width: '138'
        }, 200)
    }, function () {
        $(this).find('img').animate({
            height: '128',
            width: '128'
        }, 100);
    });
});