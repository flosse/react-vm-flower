###
This program is distributed under the terms of the GPLv3 license.
Copyright 2015 (c) Markus Kohlhase <mail@markus-kohlhase.de>
###

React = require "react"
Leaf  = require "./leaf"

{ g, path } = React.DOM

GREEN     = '#96bf0c'
YELLOW    = '#ffdd00'
BLUE      = '#0099ad'
PINK      = '#e56091'
RASPBERRY = '#aa386b'
BLUEGRAY  = '#637a84'

ANGLE     = 60
SPACE     = 6

SIZE      = 2 * Leaf.height + 2 * SPACE

rad = (deg) -> deg * Math.PI / 180

getTransformation = (deg, s=1) ->
  "translate(#{SPACE * Math.cos rad deg},#{SPACE * Math.sin rad deg}) \
  rotate(#{deg-90}) \
  scale(#{s})
  "

module.exports = React.createClass

  displayName: "Flower"

  getDefaultProps: ->
    scales: [ 1, 1, 1, 1, 1, 1 ]

  statics:
    size  : SIZE
    Leaf  : Leaf

  render: ->
    s = @props.scales
    g transform: @props.transform,
      React.createElement Leaf,
        transform: getTransformation 0, s[0]
        color: RASPBERRY
      React.createElement Leaf,
        transform: getTransformation ANGLE, s[1]
        color: BLUE
      React.createElement Leaf,
        transform: getTransformation 2 *ANGLE, s[2]
        color: BLUEGRAY
      React.createElement Leaf,
        color: GREEN
        transform: getTransformation 3 *ANGLE, s[3]
      React.createElement Leaf,
        color: YELLOW
        transform: getTransformation 4 *ANGLE, s[4]
      React.createElement Leaf,
        transform: getTransformation 5 *ANGLE, s[5]
        color: PINK
