# Given a collection of numbers that might contain duplicates, return all possible unique permutations.

# Example:

# Input: [1,1,2]
# Output:
# [
#   [1,1,2],
#   [1,2,1],
#   [2,1,1]
# ]

def permute_unique(nums)
    return [[]] if nums.empty?
    perms = []
    nums.length.times do |i|
        el = nums[i]
        rest = nums.take(i) + nums.drop(i+1)
        new_perms = permute_unique(rest).map {|perm| perm.unshift(el)}
        perms.concat(new_perms)
    end 
    perms.uniq
end