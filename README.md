# Legal Ass…

![](http://cl.ly/XnDW/Screen%20Shot%202014-09-30%20at%2011.32.37%20AM.png)

Truncates text. Prevents embarassing word splices. Truncation + business rules = FUNcation!

[![Build Status](https://travis-ci.org/banterability/legal-ass.svg?branch=master)](https://travis-ci.org/banterability/legal-ass)

## Installation

```bash
npm install legal-ass --save
```

## Usage

**`LegalAss(phrase, options)`**, where `phrase` is the string you'd like truncated and `options` is an object specifying the following:

| Key        | Value | Required? |
| ---------- | ---- | ----- |
| length     | (Integer) The maximum number of characters in the truncated return string, including a single-character ellipses (…) if necessary. | **Yes** |
| splitWords | (Boolean) Should the library truncate in the middle of a word? Defaults to `false`, meaning that the return string may be shorter than `length` if that's necessary to split on a word boundary. | No |

```js
var LegalAss = require('legal-ass');

LegalAss('So this is a story all about how', {length: 22});
// -> 'So this is a story…'
```

Note that the returned string is only 19 characters long, since a longer string would have split in the middle of the word "all". If you don't care about this, pass `{splitWords: true}`:

```js
LegalAss = require('legal-ass');

LegalAss('So this is a story all about how', {length: 22, splitWords: true});
// -> 'So this is a story al…'
```
