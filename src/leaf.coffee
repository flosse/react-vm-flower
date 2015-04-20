###
This program is distributed under the terms of the GPLv3 license.
Copyright 2015 (c) Markus Kohlhase <mail@markus-kohlhase.de>
###

React = require "react"

WIDTH  = 70
HEIGHT = 100

DELTA  = WIDTH / 2 * 0.53
P0 =
  x: 0
  y: 0

P1 =
  x: WIDTH/2
  y: 0.65* HEIGHT

P2 =
  x: 0
  y: HEIGHT

LEAF_SHAPE =

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

module.exports = React.createClass

  statics:
    width : WIDTH
    height: HEIGHT

  displayName: "Leaf"

  getDefaultProps: ->
    color: "#000"

  render: ->
    path
      d         : LEAF_SHAPE
      fill      : @props.color
      transform : @props.transform
