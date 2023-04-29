require 'spec_helper'
require_relative '../caesar_cipher'

RSpec.describe '#caesar_cipher' do
  it 'returns an empty string when given an empty string' do
    expect(caesar_cipher('', 5)).to eq('')
  end
  
  it 'shifts each letter in the string by the shift factor' do
    expect(caesar_cipher('hello', 3)).to eq('khoor')
    expect(caesar_cipher('world', 7)).to eq('dvysk')
  end
  
  it "wraps around from 'Z' to 'A' and from 'z' to 'a'" do
    expect(caesar_cipher('Zebra', 3)).to eq('Cheud')
    expect(caesar_cipher('zany', 7)).to eq('ghuf')
  end
  
  it 'preserves non-letter characters' do
    expect(caesar_cipher('What a string!', 5)).to eq('Bmfy f xywnsl!')
    expect(caesar_cipher('12abc!#$', 3)).to eq('12def!#$')
  end
end