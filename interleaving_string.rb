# Given s1, s2, s3, find whether s3 is formed by the interleaving of s1 and s2.

# Example 1:

# Input: s1 = "aabcc", s2 = "dbbca", s3 = "aadbbcbcac"
# Output: true
# Example 2:

# Input: s1 = "aabcc", s2 = "dbbca", s3 = "aadbbbaccc"
# Output: false

def is_interleave(s1, s2, s3)
    return false unless s1.length + s2.length == s3.length
    seen = Hash.new(false)
    indicies = [[0,0]]

    until indicies.empty?
        s1_index, s2_index = indicies.shift
        s3_index = s1_index + s2_index
        return true if s3_index == s3.length
        
        if s1[s1_index] == s3[s3_index]
            new_indicies = [s1_index + 1, s2_index]
            if !seen[new_indicies]
                seen[new_indicies] = true
                indicies << new_indicies
            end 
        end 
        
        if s2[s2_index] == s3[s3_index]
            new_indicies = [s1_index, s2_index + 1]
            if !seen[new_indicies]
                seen[new_indicies] = true
                indicies << new_indicies
            end 
        end 
    end 
    false
end