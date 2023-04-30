require 'spec_helper'
require_relative '../bubble_sort'

describe "#bubble_sort" do
  it 'returns an empty array when given an empty array' do
    expect(bubble_sort([])).to eq([])
  end

  it 'returns the sorted array when given an array of integers' do
    expect(bubble_sort([4,3,78,2,0,2])).to eq([0,2,2,3,4,78])
  end

  it 'returns the same array when given an already sorted array' do
    expect(bubble_sort([1,2,3,4,5])).to eq([1,2,3,4,5])
  end

  it 'returns the sorted array when given an array in descending order' do
    expect(bubble_sort([5,4,3,2,1])).to eq([1,2,3,4,5])
  end

  it 'returns the sorted array when given an array with duplicate elements' do
    expect(bubble_sort([4,3,1,2,4,5])).to eq([1,2,3,4,4,5])
  end
end