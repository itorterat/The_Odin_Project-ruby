require 'spec_helper'
require_relative '../substrings'

RSpec.describe '#substrings' do
  let(:dictionary) {
    [
      'below', 'down', 'go', 'going', 'horn', 'how', 'howdy',
      'it', 'i', 'low', 'own', 'part', 'partner', 'sit'
    ]
  }

  it 'returns a hash with the counts of substrings found in the word' do
    expect(substrings('below', dictionary)).to eq({'below' => 1, 'low' => 1})
    expect(substrings("Howdy partner, sit down! How's it going?", dictionary)).to eq(
      {
        'down' => 1, 'how' => 2, 'howdy' => 1, 'go' => 1, 'going' => 1, 'it' => 2,
        'i' => 3, 'own' => 1, 'part' => 1, 'partner' => 1, 'sit' => 1
        }
      )
    expect(substrings('no matches here', dictionary)).to eq({})
  end

  it 'is case insensitive' do
    expect(substrings('BELOW', dictionary)).to eq({'below' => 1, 'low' => 1})
    expect(substrings("HoWdY pArTnEr, sIt DoWn! HoW's It GoInG?", dictionary)).to eq(
      {
        'down' => 1, 'how' => 2, 'howdy' => 1, 'go' => 1, 'going' => 1, 'it' => 2,
        'i' => 3, 'own' => 1, 'part' => 1, 'partner' => 1, 'sit' => 1
      }
    )
  end
end