# Given a set of distinct integers, nums, return all possible subsets (the power set).

# Note: The solution set must not contain duplicate subsets.

# Example:

# Input: nums = [1,2,3]
# Output:
# [
#   [3],
#   [1],
#   [2],
#   [1,2,3],
#   [1,3],
#   [2,3],
#   [1,2],
#   []
# ]

def subsets(nums)
    return [[]] if nums.empty?
    first = nums[0]
    prev_subs = subsets(nums[1..-1])
    new_subs = prev_subs.map do |sub|
        sub + [first]
    end 
    prev_subs + new_subs
end