# Given a binary search tree, write a function kthSmallest to find the kth smallest element in it.

# Note: 
# You may assume k is always valid, 1 ≤ k ≤ BST's total elements.

# Example 1:

# Input: root = [3,1,4,null,2], k = 1
#    3
#   / \
#  1   4
#   \
#    2
# Output: 1
# Example 2:

# Input: root = [5,3,6,2,4,null,null,1], k = 3
#        5
#       / \
#      3   6
#     / \
#    2   4
#   /
#  1
# Output: 3
# Follow up:
# What if the BST is modified (insert/delete operations) often and you need to find the kth smallest frequently? How would you optimize the kthSmallest routine?

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {Integer} k
# @return {Integer}
def kth_smallest(root, k, counter = 0)
    curr = root
    is_complete = false
    result = []
    stack = []
    while !is_complete
        if curr
            stack << curr
            curr = curr.left
        else 
            if !stack.empty?
                node = stack.pop
                result << node.val
                curr = node.right
            else 
                is_complete = true
            end 
        end 
    end 
    # p result
    result[k - 1]
    
end