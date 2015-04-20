# React VM flower component

## Usage

```
npm i react-vm-flower
```

```js
var React   = require("react);
var Flower  = require("react-vm-flower");

var myFlower = svg(
  {
    viewBox: "0 0 " + Flower.size + " " + Flower.size,
    width: "200px"
  },
  g({
      transform: "translate(" + Flower.size / 2 + "," + Flower.size / 2 + ")"
    },
    React.createElement(Flower, {
      scales: [0.3, 0.7, 0.6, 0.9, 0.7, 0.7]
    })
  )
);

React.render(myFlower, document.querySelector('body'));
```

## Run tests

    npm t

## License

This project is licensed under the GPLv3 license.
