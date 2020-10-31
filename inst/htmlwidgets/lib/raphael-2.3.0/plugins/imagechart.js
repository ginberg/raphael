Raphael.fn.imageChart = function (image_src, width, height, alt) {
    var r = this;
    r.image(image_src, 0, 0, width, height);
    r.image(image_src, 0, height, width, height).attr({
        transform: "s1-1",
        opacity: .5
    });
    r.rect(0, height, width, height).attr({
        fill: "white",
        stroke: "none",
        opacity: .5
    });
};
