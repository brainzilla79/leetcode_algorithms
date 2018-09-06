# Given a collection of distinct integers, return all possible permutations.

# Example:

# Input: [1,2,3]
# Output:
# [
#   [1,2,3],
#   [1,3,2],
#   [2,1,3],
#   [2,3,1],
#   [3,1,2],
#   [3,2,1]
# ]

def permute(nums)
    return [[]] if nums.empty?
    perms = []
    nums.length.times do |i|
        el = nums[i]
        rest = nums.take(i) + nums.drop(i+1)
        new_perms = permute(rest).map {|perm| perm.unshift(el)}
        perms.concat(new_perms)
    end 
    perms
end