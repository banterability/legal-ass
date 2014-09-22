{filter, last} = require 'underscore'

module.exports = (phrase, options) ->
  length = options.length
  splitWords = options.splitWords || false

  # Return fast if phrase isn't too long
  return phrase if phrase.length <= length

  if splitWords
    truncateAtLength phrase, length
  else
    truncateAtWordBoundary phrase, length

truncateAtWordBoundary = (phrase, length) ->
  wordBoundaryRegex = /\s/g
  wordBoundaries = []
  while match = wordBoundaryRegex.exec phrase
    wordBoundaries.push match.index
  lastPossibleWord = last (filter wordBoundaries, (boundary) -> boundary < length - 1)

  # Fall back to substring if no word boundaries satisfy length
  return truncateAtLength phrase, length unless lastPossibleWord?

  truncateAtLength phrase, (lastPossibleWord + 1)

truncateAtLength = (phrase, length) ->
  phrase.substr(0, length - 1) + '…'
