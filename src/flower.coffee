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


rad = (deg) -> deg * Math.PI / 180

getTransformation = (deg, s=1) ->
  "translate(#{SPACE * Math.cos rad deg},#{SPACE * Math.sin rad deg}) \
  rotate(#{deg-90}) \
  scale(#{s})
  "

T = React.PropTypes

module.exports = React.createClass

  displayName: "Flower"

  propTypes:
    scales: T.arrayOf T.number
    size  : T.number

  getDefaultProps: ->
    scales: [ 1, 1, 1, 1, 1, 1 ]
    size  : 2 * (100 + SPACE)

  statics: { Leaf }

  render: ->
    s = @props.scales
    h = (@props.size / 2) - SPACE
    w = 0.7 * h
    g transform: @props.transform,
      React.createElement Leaf,
        transform : getTransformation 0, s[0]
        color     : RASPBERRY
        height    : h
        width     : w
      React.createElement Leaf,
        transform : getTransformation ANGLE, s[1]
        color     : BLUE
        height    : h
        width     : w
      React.createElement Leaf,
        transform : getTransformation 2 *ANGLE, s[2]
        color     : BLUEGRAY
        height    : h
        width     : w
      React.createElement Leaf,
        color     : GREEN
        transform : getTransformation 3 *ANGLE, s[3]
        height    : h
        width     : w
      React.createElement Leaf,
        color     : YELLOW
        transform : getTransformation 4 *ANGLE, s[4]
        height    : h
        width     : w
      React.createElement Leaf,
        transform : getTransformation 5 *ANGLE, s[5]
        color     : PINK
        height    : h
        width     : w
