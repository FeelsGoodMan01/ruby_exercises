dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
string = "Howdy partner, sit down! How's it going?"
def substrings (string, dictionary)
    string = string.downcase.gsub(/[^0-9a-z ]/i, '').split
    sub_hash = {}
    dictionary.each do |dict_word|
        string.each do |str_word|
            unless str_word.include?(dict_word) then next end
            sub_hash[dict_word] ? sub_hash[dict_word] += 1 : sub_hash[dict_word] = 1 
        end
    end
    puts sub_hash
end

substrings(string, dictionary)