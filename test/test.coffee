assert = require 'assertive'
LegalAss = require '../lib/'

describe 'legal-ass', ->
  it 'exists', ->
    assert.expect LegalAss

  before ->
    @phrase = 'On the playground was where I spent most of my days'

  describe 'Using default ellipses character', ->
    describe 'respecting word boundaries (default)', ->
      describe 'when phrase is shorter than character limit', ->
        it 'does not truncate', ->
          assert.equal @phrase, LegalAss @phrase, {length: 60}

      describe 'when phrase is exactly the character limit', ->
        it 'does not truncate', ->
          assert.equal @phrase, LegalAss @phrase, {length: 51}

      describe 'when phrase is longer than character limit', ->
        describe 'when character limit falls inside a word', ->
          it 'truncates after the previous full word', ->
            expected = 'On the playground…'
            assert.equal expected, LegalAss @phrase, {length: 20}

        describe 'when character limit falls exactly on the end of a word', ->
          it 'truncates after the previous full word', ->
            expected = 'On the playground…'
            assert.equal expected, LegalAss @phrase, {length: 21}

        describe 'when character limit falls between words', ->
          it 'truncates at the end of the word', ->
            expected = 'On the playground was…'
            assert.equal expected, LegalAss @phrase, {length: 22}

        describe 'when character limit falls exactly on the beginning of a word', ->
          it 'truncates after the end of the previous word', ->
            expected = 'On the playground was…'
            assert.equal expected, LegalAss @phrase, {length: 23}

        describe 'when no word boundaries are available prior to character limit', ->
          it 'truncates at the character limit', ->
            phrase = 'Triskaidekaphobia struck this June.'
            expected = 'Triskaidekap…'
            assert.equal expected, LegalAss phrase, {length: 13}

    describe 'ignoring word boundaries', ->
      describe 'when phrase is shorter than character limit', ->
        it 'does not truncate', ->
          assert.equal @phrase, LegalAss @phrase, {length: 60, splitWords: true}

      describe 'when phrase is exactly the character limit', ->
        it 'does not truncate', ->
          assert.equal @phrase, LegalAss @phrase, {length: 51, splitWords: true}

      describe 'when phrase is longer than character limit', ->
        describe 'when character limit falls inside a word', ->
          it 'truncates at the character limit', ->
            expected = 'On the playground w…'
            assert.equal expected, LegalAss @phrase, {length: 20, splitWords: true}

        describe 'when character limit falls exactly on the end of a word', ->
          it 'truncates at the character limit', ->
            expected = 'On the playground wa…'
            assert.equal expected, LegalAss @phrase, {length: 21, splitWords: true}

        describe 'when character limit falls between words', ->
          it 'truncates at the character limit', ->
            expected = 'On the playground was…'
            assert.equal expected, LegalAss @phrase, {length: 22, splitWords: true}

        describe 'when character limit falls exactly on the beginning of a word', ->
          it 'truncates after the end of the previous word', ->
            expected = 'On the playground was…'
            assert.equal expected, LegalAss @phrase, {length: 23, splitWords: true}

        describe 'when no word boundaries are available prior to character limit', ->
          it 'truncates at the character limit', ->
            phrase = 'Triskaidekaphobia struck this June.'
            expected = 'Triskaidekap…'
            assert.equal expected, LegalAss phrase, {length: 13, splitWords: true}


  describe 'Using a custom ellipses character (with variable length)', ->
    describe 'respecting word boundaries (default)', ->
      describe 'when phrase is shorter than character limit', ->
        it 'does not truncate', ->
          assert.equal @phrase, LegalAss @phrase, {length: 60, ellipses: ' >>'}

      describe 'when phrase is exactly the character limit', ->
        it 'does not truncate', ->
          assert.equal @phrase, LegalAss @phrase, {length: 51, ellipses: ' >>'}

      describe 'when phrase is longer than character limit', ->
        describe 'when character limit falls inside a word', ->
          it 'truncates after the previous full word', ->
            expected = 'On the playground >>'
            assert.equal expected, LegalAss @phrase, {length: 20, ellipses: ' >>'}

        describe 'when character limit falls exactly on the end of a word', ->
          it 'truncates after the previous full word', ->
            expected = 'On the playground >>'
            assert.equal expected, LegalAss @phrase, {length: 21, ellipses: ' >>'}

        describe 'when character limit falls between words', ->
          it 'truncates at the end of the word', ->
            expected = 'On the playground >>'
            assert.equal expected, LegalAss @phrase, {length: 22, ellipses: ' >>'}

        describe 'when character limit falls exactly on the beginning of a word', ->
          it 'truncates after the end of the previous word', ->
            expected = 'On the playground >>'
            assert.equal expected, LegalAss @phrase, {length: 23, ellipses: ' >>'}

        describe 'when no word boundaries are available prior to character limit', ->
          it 'truncates at the character limit', ->
            phrase = 'Triskaidekaphobia struck this June.'
            expected = 'Triskaidek >>'
            assert.equal expected, LegalAss phrase, {length: 13, ellipses: ' >>'}

    describe 'ignoring word boundaries', ->
      describe 'when phrase is shorter than character limit', ->
        it 'does not truncate', ->
          assert.equal @phrase, LegalAss @phrase, {length: 60, splitWords: true, ellipses: ' >>'}

      describe 'when phrase is exactly the character limit', ->
        it 'does not truncate', ->
          assert.equal @phrase, LegalAss @phrase, {length: 51, splitWords: true, ellipses: ' >>'}

      describe 'when phrase is longer than character limit', ->
        describe 'when character limit falls inside a word', ->
          it 'truncates at the character limit', ->
            expected = 'On the playground >>'
            assert.equal expected, LegalAss @phrase, {length: 20, splitWords: true, ellipses: ' >>'}

        describe 'when character limit falls exactly on the end of a word', ->
          it 'truncates at the character limit', ->
            expected = 'On the playground >>'
            assert.equal expected, LegalAss @phrase, {length: 21, splitWords: true, ellipses: ' >>'}

        describe 'when character limit falls between words', ->
          it 'truncates at the character limit', ->
            expected = 'On the playground w >>'
            assert.equal expected, LegalAss @phrase, {length: 22, splitWords: true, ellipses: ' >>'}

        describe 'when character limit falls exactly on the beginning of a word', ->
          it 'truncates at the character limit', ->
            expected = 'On the playground wa >>'
            assert.equal expected, LegalAss @phrase, {length: 23, splitWords: true, ellipses: ' >>'}

        describe 'when no word boundaries are available prior to character limit', ->
          it 'truncates at the character limit', ->
            phrase = 'Triskaidekaphobia struck this June.'
            expected = 'Triskaidek >>'
            assert.equal expected, LegalAss phrase, {length: 13, splitWords: true, ellipses: ' >>'}
