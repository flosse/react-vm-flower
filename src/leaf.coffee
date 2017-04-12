###
This program is distributed under the terms of the GPLv3 license.
Copyright (c) 2015 - 2017 Markus Kohlhase <mail@markus-kohlhase.de>
###

React     = require "react"
PureMixin = require "react-pure-render/mixin"

leafShape = (w, h) ->

  DELTA  = w / 2 * 0.53
  P0 =
    x: 0
    y: 0

  P1 =
    x: w/2
    y: 0.65* h

  P2 =
    x: 0
    y: h

  # move to P0
  "M #{P0.x},#{P0.y} "            +

  # start a bezier curve
  "C #{P0.x},#{P0.y} "            +

  # P1
  "#{P1.x},#{P1.y - DELTA} "      +
  "#{P1.x},#{P1.y} "              +
  "#{P1.x},#{P1.y + DELTA} "      +

  # P2
  "#{P2.x + DELTA},#{P2.y} "      +
  "#{P2.x},#{P2.y} "              +
  "#{P2.x - DELTA},#{P2.y} "      +

  # mirroed P1
  "#{-1 * P1.x},#{P1.y + DELTA} " +
  "#{-1 * P1.x},#{P1.y} "         +
  "#{-1 * P1.x},#{P1.y - DELTA} " +

  # close the path
  "#{P0.x},#{P0.y} #{P0.x},#{P0.y} Z"

{ path } = React.DOM

T = React.PropTypes

module.exports = React.createClass

  displayName: "Leaf"

  mixins: [ PureMixin ]

  propTypes:
    color   : T.string
    height  : T.number
    witdh   : T.number

  getDefaultProps: ->
    color   : "#000"
    height  : 100
    witdh   : 70

  render: ->
    path
      d         : leafShape @props.width, @props.height
      fill      : @props.color
      transform : @props.transform
