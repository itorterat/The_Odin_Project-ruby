require 'spec_helper'
require_relative '../stock_picker'

RSpec.describe '#stock_picker' do
  it 'returns the correct pair of days for the example input' do
    expect(stock_picker([17,3,6,9,15,8,6,1,10])).to eq([1,4])
  end

  it 'returns an empty array for an empty input array' do
    expect(stock_picker([])).to eq([])
  end

  it 'returns an empty array for an input array with only one element' do
    expect(stock_picker([10])).to eq([])
  end

  it 'returns the first and last days for an input array with the same price every day' do
    expect(stock_picker([10, 10, 10, 10, 10])).to eq([0,1])
  end

  it 'returns the earliest pair of days that yield the highest profit' do
    expect(stock_picker([10, 5, 20, 2, 15])).to eq([1,2])
  end
end