module.exports = (phrase, options) ->
  length = options.length
  splitWords = options.splitWords || false


  return phrase if phrase.length <= length
  if splitWords
    phrase.substr(0, length - 1) + '…'
  else
    phrase.substr(0, length - 1) + '…'


# truncateAtWordBoundary = (phrase, length) ->


truncateAtLength = (phrase, length) ->
  phrase.substr(0, length - 1) + '…'