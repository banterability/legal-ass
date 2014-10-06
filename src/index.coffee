{filter, last} = require 'underscore'

module.exports = (phrase, options = {}) ->

  # Return if phrase isn't too long
  return phrase if phrase.length <= options.length

  ellipses = options.ellipses || '…'
  phraseLength = options.length - ellipses.length

  truncationOptions =
    length: phraseLength
    ellipses: ellipses

  if options.splitWords
    truncateAtLength phrase, truncationOptions
  else
    truncateAtWordBoundary phrase, truncationOptions

truncateAtWordBoundary = (phrase, {length, ellipses}) ->
  wordBoundaryRegex = /\s/g
  wordBoundaries = []
  while match = wordBoundaryRegex.exec phrase
    wordBoundaries.push match.index
  lastPossibleWord = last (filter wordBoundaries, (boundary) -> boundary <= length)

  # Fall back to substring if no word boundaries satisfy length
  return truncateAtLength phrase, {length, ellipses} unless lastPossibleWord?

  truncateAtLength phrase, {length: lastPossibleWord, ellipses}

truncateAtLength = (phrase, {length, ellipses}) ->
  truncatedPhrase = phrase[0...length]
  truncatedPhrase.trimRight() + ellipses
