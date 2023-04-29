def caesar_cipher(plain_message, shift_factor)
  shifted_message = ''
  plain_message.each_char do |char|
    if char =~ /[a-zA-Z]/
      shifted_char = char.ord + shift_factor
      if (char.upcase == char && shifted_char > "Z".ord) || (char.downcase == char && shifted_char > "z".ord)
        shifted_char -= 26
      end
      shifted_message += shifted_char.chr
    else
      shifted_message += char
    end
  end
  shifted_message
end