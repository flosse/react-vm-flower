React   = require "react"
Flower  = require "../src/flower"

{ svg, g, circle } = React.DOM

PADDING = 5
CX      = PADDING + Flower.size/2
CY      = CX

myFlower = svg
  viewBox: "0 0 #{2 * PADDING + Flower.size} #{ 2 * PADDING + Flower.size}"
  width:"200px",
    g transform: "translate(#{CX},#{CY})",
      circle
        cx: 0
        cy: 0
        r: PADDING - 1 + Flower.size / 2
        fill: "#eee"
        stroke: "#aaa"
        strokeWidth: 2
      React.createElement Flower,
        scales: [0.3, 0.7, 0.6, 0.9, 0.7, 0.7]

React.render (myFlower), document.querySelector 'body'
