assert = require 'assertive'
LegalAss = require '../lib/'

describe 'legal-ass', ->
  it 'exists', ->
    assert.expect LegalAss

  describe 'truncation', ->
    describe 'ignoring word boundaries', ->
      it 'does not truncate phrases that are not too long', ->
        phrase = 'On the playground was where I spent most of my days'
        assert.equal phrase, LegalAss phrase, {length: 60, splitWords: true}

      it 'truncates phrases that are too long', ->
        phrase = 'On the playground was where I spent most of my days'
        expected = 'On the playground was wh…'
        assert.equal expected, LegalAss phrase, {length: 25, splitWords: true}

      it 'does not truncate phrases that are exactly long enough', ->
        phrase = 'On the playground was where I spent most of my days'
        assert.equal phrase, LegalAss phrase, {length: 51, splitWords: true}

