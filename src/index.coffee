{filter, last} = require 'underscore'

module.exports = (phrase, options = {}) ->
  length = options.length

  # Return if phrase isn't too long
  return phrase if phrase.length <= length

  if options.splitWords
    truncateAtLength phrase, length
  else
    truncateAtWordBoundary phrase, length

truncateAtWordBoundary = (phrase, length) ->
  wordBoundaryRegex = /\s/g
  wordBoundaries = []
  while match = wordBoundaryRegex.exec phrase
    wordBoundaries.push match.index
  lastPossibleWord = last (filter wordBoundaries, (boundary) -> boundary < length)

  # Fall back to substring if no word boundaries satisfy length
  return truncateAtLength phrase, length unless lastPossibleWord?

  truncateAtLength phrase, lastPossibleWord + 1

truncateAtLength = (phrase, length) ->
  truncatedPhrase = phrase.substr(0, length - 1)
  truncatedPhrase.trimRight() + '…'
