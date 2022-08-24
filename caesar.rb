def caesar_cipher(string, shift)
    shift = shift > 0 ? shift % 26 : shift % -26
    direction = shift > 0 ? 26 : -26
    string.each_char do |c|
        ciphered = c.ord
        unless ciphered.between?(65,90) || ciphered.between?(97,122)
            print ciphered.chr
            next
        end
        range = c.ord.between?(65,90) ? (65..90) : (97..122)
        unless range.include?(ciphered + shift)
            print (ciphered + shift - direction).chr
            next
        else
            print (ciphered + shift).chr
            next
        end
    end
    puts
end
while true
    puts "What do you need to cipher?"
    value = gets.chomp
    return if value == 'exit'
    puts "For how many digits?"
    digit = gets.to_i
    caesar_cipher(value, digit)
end