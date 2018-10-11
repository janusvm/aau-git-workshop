var graphConfig = new GitGraph.Template({
  colors: ["#979797", "#008fb5", "#f1c109"],
  branch: {
    lineWidth: 10,
    spacingX: 50,
    labelRotation: 0
  },
  commit: {
    spacingY: -80,
    dot: {
      size: 14
    },
    message: {
      font: "normal 14pt Arial"
    }
  }
});

var metro = new GitGraph({
  template: graphConfig,
  mode: "compact",
  orientation: "horizontal",
  elementId: "my-gitgraph"
});

var memaster = metro.branch("master").commit().commit();
var medevelop = metro.branch("develop").commit();
memaster.commit();
medevelop.commit().commit();
medevelop.merge(memaster);

var c = getElementById("my-gitgraph");
var ctx = c.getContext("2d");
ctx.scale(2, 2);
