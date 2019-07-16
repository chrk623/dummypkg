HTMLWidgets.widget({

  name: 'dummywidget',

  type: 'output',

  factory: function(el, width, height) {
    // TODO: define shared variables for this instance
    let svg_width = width;
    let svg_height = height;
    let svg = d3.select(el)
      .append("svg");
    return {

      renderValue: function(x) {
        // create rect
        let rect = svg.append("rect")
          .attr("x", 0)
          .attr("y", 0)
          .attr("width", 20)
          .attr("height", 20)
          .style("fill", x.col);
        // animate rect
        for (let i = 0; i < 10; i++) {
          rect.transition()
            .duration(1500)
            .delay(i * 1500)
            .attr("x", i * 20);
        }
      },

      resize: function(width, height) {
        // TODO: code to re-render the widget with a new size
      }

    };
  }
});
