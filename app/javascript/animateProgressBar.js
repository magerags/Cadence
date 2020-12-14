function animateProgressBar(el, width) {
    el.animate({ width: width }, {
        duration: 2000,
        step: function(now, fx) {
            if (fx.prop == "width") {
                el.html(el.data("name") + ": " + Math.round(now * 100) / 100 + "%");
            }
        },
    });
}

$(".progress").each(function() {
    animateProgressBar($(this).find("div"), $(this).data("width"));
});