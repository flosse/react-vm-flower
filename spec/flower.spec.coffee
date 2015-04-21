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

  it "should export the Leaf component", ->
    Flower.Leaf.should.be.a 'function'

  it "should set some space between the the leaves", ->
    res = render().match ///
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
