def substrings(word, dictionary)
  downcased_word = word.downcase
  dictionary.each_with_object(Hash.new(0)) do |substring, counts|
    counts[substring] += downcased_word.scan(substring.downcase).length if downcased_word.include?(substring.downcase)
  end
end