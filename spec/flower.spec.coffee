(require "chai").should()

React   = require "react"
Flower  = require "../src/flower"

render = (props) ->
  React.renderToStaticMarkup React.createElement Flower, props

describe "The flower", ->

  it "should be a svg group", ->
    render().should.match /^\<g.*\<\/g\>$/

  it "should contain six leaves", ->
    render().should.match /^.*(\<path.*\>){6}$/g

  it "should rotate the leaves", ->
    res = render().match /rotate\([-+]?\d*\)/g
    res[0].should.have.string "rotate(-90)"
    res[1].should.have.string "rotate(-30)"
    res[2].should.have.string "rotate(30)"
    res[3].should.have.string "rotate(90)"
    res[4].should.have.string "rotate(150)"
    res[5].should.have.string "rotate(210)"

  it "should scale the leaves", ->
    res = render(scales:[2,3]).match /scale\([-+]?\d*\)/g
    res[0].should.have.string "scale(2)"
    res[1].should.have.string "scale(3)"
    res[2].should.have.string "scale(1)"
    res[4].should.have.string "scale(1)"
    res[5].should.have.string "scale(1)"

  it "should support custom colors", ->
    m = ///
      \s
      (fill=\")
      (
        (\#[a-f|0-9]{3,6}) | ([a-z]{2,}) | (rgba\((\d*\,){3} (\d.*)\))
      )(\"\s)
    ///g
    res = render(colors:["#0f0","red", "rgba(0,100,200,0.3)"]).match m
    res[0].should.have.string 'fill="#0f0"'
    res[1].should.have.string 'fill="red"'
    res[2].should.have.string "rgba(0,100,200,0.3)"

  it "should use default colors", ->
    m = ///
      \s
      (fill=\")
      (
        (\#[a-f|0-9]{3,6}) | ([a-z]{2,}) | (rgba\((\d*\,){3} (\d.*)\))
      )(\"\s)
    ///g
    res = render().match m
    res[0].should.have.string '#96bf0c'
    res[1].should.have.string '#ffdd00'
    res[2].should.have.string '#e56091'
    res[3].should.have.string '#aa386b'
    res[4].should.have.string '#0099ad'
    res[5].should.have.string '#637a84'

  it "should export the Leaf component", ->
    Flower.Leaf.should.be.a 'function'

  it "should set some space between the the leaves", ->
    res = render(space:6).match ///
        translate\(
        [+-]?
        \d*
        (
          \.\d*(e-\d*)?
        )?
        ,
        [+-]?
        \d*
        (
          \.\d*(e-\d*)?
        )?
        \)
      ///g
    space = 6
    res[0].should.have.string "translate(#{space},0)"
    res[3].should.have.string "translate(-#{space}"
