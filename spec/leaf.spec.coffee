(require "chai").should()

React = require "react"
Leaf  = require "../src/leaf"

render = (props) ->
  React.renderToStaticMarkup React.createElement Leaf, props

describe "The leaf", ->

  it "should be a svg path", ->
    render().should.match /^\<path.*\>$/

  it "should be placed at 0,0", ->
    render().should.match /d\s*=\s*"\s*M\s*0\s*,\s*0.*".*$/

  it "should be filled with black by default", ->
    render().should.have.string 'fill="#000"'

  it "can be filled with a custom color", ->
    (render color: '#f00').should.have.string 'fill="#f00"'

  it "should take transform properties", ->
    (render transform: 'scale(2)').should.have.string 'scale(2)'

  it "should process the width and height property", ->
    res = render width: 5, height: 7
    res.should.match /d="M\s0,0\sC.*2\.5.*0,7.*-2\.5.*Z"/
    res = render width: 10, height: 12
    res.should.match /d="M\s0,0\sC.*5.*0,12.*-5.*Z"/
