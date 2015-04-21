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


rad = (deg) -> deg * Math.PI / 180

T = React.PropTypes

module.exports = React.createClass

  displayName: "Flower"

  propTypes:
    scales: T.arrayOf T.number
    size  : T.number
    space : T.number

  getDefaultProps: ->
    scales: [ 1, 1, 1, 1, 1, 1 ]
    size  : 100

  statics: { Leaf }

  getTransformation: (i, space) ->
    deg = i * ANGLE
    "translate(#{space * Math.cos rad deg},#{space * Math.sin rad deg}) \
    rotate(#{deg-90}) \
    scale(#{@props.scales[i]})"

  getSpace: -> if (s = @props.space)? then s else @props.size * 0.03

  render: ->
    space = @getSpace()
    s = @props.scales
    h = (@props.size / 2) - space
    w = 0.7 * h
    g transform: @props.transform,
      React.createElement Leaf,
        transform : @getTransformation 0, space
        color     : RASPBERRY
        height    : h
        width     : w
      React.createElement Leaf,
        transform : @getTransformation 1, space
        color     : BLUE
        height    : h
        width     : w
      React.createElement Leaf,
        transform : @getTransformation 2, space
        color     : BLUEGRAY
        height    : h
        width     : w
      React.createElement Leaf,
        color     : GREEN
        transform : @getTransformation 3, space
        height    : h
        width     : w
      React.createElement Leaf,
        color     : YELLOW
        transform : @getTransformation 4, space
        height    : h
        width     : w
      React.createElement Leaf,
        transform : @getTransformation 5, space
        color     : PINK
        height    : h
        width     : w
