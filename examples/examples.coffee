React   = require "react"
Flower  = require "../src/flower"

{ svg, g, circle } = React.DOM

PADDING = 5
RADIUS  = 100
CX      = RADIUS
CY      = CX

myFlower = svg
  viewBox: "0 0 #{2 * RADIUS} #{ 2 * RADIUS}"
  width:"200px",
    g transform: "translate(#{CX},#{CY})",
      circle
        cx: 0
        cy: 0
        r: RADIUS-1
        fill: "#eee"
        stroke: "#aaa"
        strokeWidth: 2
      React.createElement Flower,
        scales: [0.3, 0.7, 0.6, 0.9, 0.7, 0.7]
        size: 2 * (RADIUS - PADDING)

React.render (myFlower), document.querySelector 'body'
