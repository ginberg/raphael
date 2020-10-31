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
        if (!width) {
          width = 900;
        }
        if (!height) {
          height = 600;
        }
        chart = Raphael(el.id, width, height);
        if (x.type == "pie") {
          chart.pieChart(300, 300, 200, x.values, x.labels, "#fff");
        } if (x.type == "image") {
          chart.imageChart(x.src, width/2, height/2, "test");
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
