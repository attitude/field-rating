# Rating Field for [Cockpit](https://github.com/aheinze/cockpit/tree/next)

![Preview](preview.png)

## Installation

```
$ cd cockpit/modules/addons
$ git clone git@github.com:attitude/field-rating.git
```
_Note: Directory must be named **field-rating** for Cockpit to register addon._

## Options

| Paramenter | Type      | Description
|:-----------|:---------:|:------------
| minimum    | *int*     | Rating minimum, default: `0`
| maximum    | *int*     | Rating maximum, default: `5`
| icon       | *string*  | Icon name, default: `star`
| remove     | *boolean* | Removes rating by setting `null`, instead of setting minimum, default: `false`
| precision  | *0 … 0.5*   | Fraction to round number, maximum of 3 decimal places, example: `0.25` will round number in steps of `0.25`: `0`, `0.25`, `0.5`, `0.75`,…

*Note: Half stars are not supported, since icon can be changed and there is only star icon available as half icon. Numeric value is always displayed.*

Feel free to test it and let me know [@martin_adamko](https://twitter.com/martin_adamko) how works for you. Feel free to open issue if you find one.

Enjoy!
