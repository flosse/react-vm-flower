path      = require "path"
webpack   = require "webpack"

module.exports =
  target: "web"
  entry: path.join __dirname,  "examples.coffee"
  output:
    filename: 'examples.js'
  module:
    loaders: [
      {
        test:   /\.coffee$/,
        loader: "coffee-loader"
      }
    ]
    noParse:[
       /\.min\.js/
       path.join __dirname, 'bower_components'
    ]
  resolve:
    extensions: ["", ".js", ".coffee"]
    modulesDirectories: ['node_modules', 'bower_components']
