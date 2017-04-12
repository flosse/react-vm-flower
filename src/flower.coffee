###
This program is distributed under the terms of the GPLv3 license.
Copyright (c) 2015 - 2017 Markus Kohlhase <mail@markus-kohlhase.de>
###

React     = require "react"
Leaf      = require "./leaf"
PureMixin = require "react-pure-render/mixin"

{ g, path } = React.DOM

COLORS = [
  '#96bf0c' # GREEN
  '#ffdd00' # YELLOW
  '#e56091' # PINK
  '#aa386b' # RASPBERRY
  '#0099ad' # BLUE
  '#637a84' # BLUEGRAY
]

ANGLE = 60

rad = (deg) -> deg * Math.PI / 180

T = React.PropTypes

module.exports = React.createClass

  displayName: "Flower"

  mixins: [ PureMixin ]

  propTypes:
    scales: T.arrayOf T.number
    colors: T.arrayOf T.string
    size  : T.number
    space : T.number

  getDefaultProps: ->
    scales: [ 1, 1, 1, 1, 1, 1 ]
    size  : 100

  statics: { Leaf }

  getTransformation: (i, space) ->
    deg = i * ANGLE
    s = @props.scales[i]
    s ?= 1
    "translate(#{space * Math.cos rad deg},#{space * Math.sin rad deg}) \
    rotate(#{deg-90}) \
    scale(#{s})"

  getSpace: -> if (s = @props.space)? then s else @props.size * 0.03

  render: ->
    space = @getSpace()
    s = @props.scales
    h = (@props.size / 2) - space
    w = 0.7 * h
    leafs = for i in [0..5]
      React.createElement Leaf,
        key       : i
        transform : @getTransformation i, space
        color     : @props.colors?[i] or COLORS[i]
        height    : h
        width     : w

    g transform: @props.transform, leafs
