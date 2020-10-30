HTMLWidgets.widget({

  name: 'raphael',

  type: 'output',

  factory: function(el, width, height) {

    // define shared variables for this instance
    var chart, opts;

    return {

      renderValue: function(x) {
        // parse x
        chart = Raphael(el.id, 900, 600);
        if (x.type == "pie") {
          chart.pieChart(350, 350, 200, x.values, x.labels, "#fff");
        }
      },

      resize: function(width, height) {
        if (chart) {
          chart.resize({width: width, height: height});
        }
      }

    };
  }
});
