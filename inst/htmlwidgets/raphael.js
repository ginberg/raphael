HTMLWidgets.widget({

  name: 'raphael',

  type: 'output',

  factory: function(el, width, height) {

    // define shared variables for this instance
    var chart, opts;

    return {

      renderValue: function(x) {
        // remove existing element
        try {var element = document.getElementById(el.id);
             element.innerHTML = '';}
        catch(err) {/*do nothing*/}

        // create chart
        chart = Raphael(el.id, 900, 600);
        if (x.type == "pie") {
          chart.pieChart(350, 250, 200, x.values, x.labels, "#fff");
        }
      },

      resize: function(width, height) {
        if (chart) {
          chart.setSize({width: width, height: height});
        }
      }

    };
  }
});
