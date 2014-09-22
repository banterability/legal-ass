module.exports = (phrase, options) ->
  {length} = options
  return phrase if phrase.length <= length
  phrase.substr(0, length - 1) + '…'
