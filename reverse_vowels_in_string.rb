# Write a function that takes a string as input and reverse only the vowels of a string.

# Example 1:

# Input: "hello"
# Output: "holle"
# Example 2:

# Input: "leetcode"
# Output: "leotcede"
# Note:
# The vowels does not include the letter "y".

# @param {String} s
# @return {String}
require 'set'
def reverse_vowels(s)
    vowels = ['a', 'e', 'i', 'o', 'u'].to_set
    i = 0
    j = s.length - 1
    while i < j 
        i += 1 until i == j || vowels.include?(s[i].downcase)
        j -= 1 until i == j || vowels.include?(s[j].downcase)
        return s if i >= j 
        s[i], s[j] = s[j], s[i]
        i += 1 
        j -= 1
    end 
    s
end