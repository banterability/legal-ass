assert = require 'assertive'
LegalAss = require '../lib/'

describe 'legal-ass', ->
  it 'exists', ->
    assert.expect LegalAss

  describe 'truncation', ->
    describe 'length', ->
      it 'does not truncate phrases that are not too long', ->
        phrase = 'On the playground was where I spent most of my days'
        assert.equal phrase, LegalAss phrase, length: 60

      it 'truncates phrases that are too long', ->
        phrase = 'On the playground was where I spent most of my days'
        expected = 'On the playground was where I…'
        assert.equal expected, LegalAss phrase, length: 30

      it 'does not truncate phrases that are exactly long enough', ->
        phrase = 'On the playground was where I spent most of my days'
        assert.equal phrase, LegalAss phrase, length: 51