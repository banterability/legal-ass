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
| length     | (Integer) The maximum number of characters in the truncated return string, including any ellipses string that follows. | **Yes** |
| splitWords | (Boolean) Should the library truncate in the middle of a word? Defaults to `false`, meaning that the return string may be shorter than `length` if that's necessary to split between words. | No |
| ellipses   | (String) A string to append to the end of the truncated text. Its length will be factored in to where a string truncates. Defaults to a single-character ellipses (`…`). | No |

```js
var LegalAss = require('legal-ass');

LegalAss('So this is a story all about how', {length: 22});
// -> 'So this is a story…'
```

Note that the returned string is only 19 characters long, since a longer string would have split in the middle of the word "all". If you don't care about this, pass `{splitWords: true}`:

```js
LegalAss('So this is a story all about how', {length: 22, splitWords: true});
// -> 'So this is a story al…'
```

If you'd like to use your own string instead of ellipses, pass that as `ellipses`:

```js
LegalAss('So this is a story all about how', {length: 22, ellipses: ' (More >)'});
// -> 'So this is a (More >)'
```

Note that the original phrase above was truncated with a trailing space and the library made the end result an additional character shorter by eliminating it.
