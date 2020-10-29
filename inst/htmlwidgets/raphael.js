HTMLWidgets.widget({

  name: 'raphael',

  type: 'output',

  factory: function(el, width, height) {

    // define shared variables for this instance
    var chart, opts;

    return {

      renderValue: function(x) {
        // TODO parse x
        chart = Raphael(el.id, 900, 600);
        var labels = ["Ruby", "JavaScript", "Shell", "Python", "PHP", "C", "Perl", "C++", "Java", "Objective-C"];
        var values = [40, 26, 5, 5, 4, 4, 3, 2, 2, 2];
        chart.pieChart(350, 350, 200, values, labels, "#fff");
      },

      resize: function(width, height) {
        if (chart) {
          chart.resize({width: width, height: height});
        }
      }

    };
  }
});
