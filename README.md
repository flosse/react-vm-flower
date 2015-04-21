# React VM flower component


[![Build Status](https://secure.travis-ci.org/flosse/react-vm-flower.svg?branch=master)](http://travis-ci.org/flosse/react-vm-flower)
[![Dependency Status](https://gemnasium.com/flosse/react-vm-flower.svg)](https://gemnasium.com/flosse/react-vm-flower)
[![NPM version](https://badge.fury.io/js/react-vm-flower.svg)](http://badge.fury.io/js/react-vm-flower)
[![License](https://img.shields.io/npm/l/react-vm-flower.svg)](https://github.com/flosse/react-vm-flower/blob/master/LICENCE.txt)

![flower](https://raw.githubusercontent.com/flosse/react-vm-flower/master/examples/myFlower.png)

## Usage

```
npm i react-vm-flower
```

```js
var React   = require("react");
var Flower  = require("react-vm-flower");
var radius  = 100;

var myFlower = svg(
  {
    viewBox: "0 0 " + 2 * radius + " " + 2 * radius,
    width: "200px"
  },
  g({
      transform: "translate(" + radius + "," + radius + ")"
    },
    React.createElement(Flower, {
      scales: [0.3, 0.7, 0.6, 0.9, 0.7, 0.7]
      size: 2 * radius
    })
  )
);

React.render(myFlower, document.querySelector('body'));
```

## Run tests

    npm t

## License

This project is licensed under the GPLv3 license.
