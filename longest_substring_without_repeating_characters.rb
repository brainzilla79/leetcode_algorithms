# Given a string, find the length of the longest substring without repeating characters.

# Example 1:

# Input: "abcabcbb"
# Output: 3 
# Explanation: The answer is "abc", which the length is 3.
# Example 2:

# Input: "bbbbb"
# Output: 1
# Explanation: The answer is "b", with the length of 1.
# Example 3:

# Input: "pwwkew"
# Output: 3
# Explanation: The answer is "wke", with the length of 3. 
#              Note that the answer must be a substring, "pwke" is a subsequence and not a substring.


def length_of_longest_substring(s)
    hash = {}
    start = 0
    result = 0
    s.chars.each_with_index do |chr, i|
        if hash[chr]
          result = [result, i - start].max
          start = [start, hash[chr] + 1].max  
        end 
    hash[chr] = i
    end 
    [sresult, s.length - start].max
    
end