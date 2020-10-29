HTMLWidgets.widget({

  name: "raphael",

  type: "output",

  factory: function(el, width, height) {

    // create our raphael object and bind it to the element
    var chart, opts;

    return {
      renderValue: function(x) {
        // TODO parse x
        chart = raphael.init(document.getElementById(el.id), 640, 480);
        var circle = chart.circle(500, 100, 100);
        circle.attr("fill", "#f00");
        circle.attr("stroke", "#fff");
      },

      getChart: function(){
        return chart;
      },

      getOpts: function(){
        return opts;
      },

      resize: function(width, height) {
        if (chart) {
          chart.resize({width: width, height: height});
        }
      },

      // Make the raphael object available as a property on the widget
      // instance we're returning from factory(). This is generally a
      // good idea for extensibility--it helps users of this widget
      // interact directly with raphael, if needed.
      s: chart
    };
  }
});
