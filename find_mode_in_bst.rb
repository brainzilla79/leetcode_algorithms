# Given a binary search tree (BST) with duplicates, find all the mode(s) (the most frequently occurred element) in the given BST.

# Assume a BST is defined as follows:

# The left subtree of a node contains only nodes with keys less than or equal to the node's key.
# The right subtree of a node contains only nodes with keys greater than or equal to the node's key.
# Both the left and right subtrees must also be binary search trees.
 

# For example:
# Given BST [1,null,2,2],

#    1
#     \
#      2
#     /
#    2
 

# return [2].

# Note: If a tree has more than one mode, you can return them in any order.

# Follow up: Could you do that without using any extra space? (Assume that the implicit stack space incurred due to recursion does not count).

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer[]}
def inorder(root, ar)
    inorder(root.left, ar) if root.left
    ar << root
    inorder(root.right, ar) if root.right
end 

def find_mode(root)
    return [] if root.nil?
    ar = []
    inorder(root, ar)
    hash = Hash.new(0)
    ar.each {|node| hash[node.val] += 1}
    max = hash.values.max
    res = []
    hash.each {|k, v| res << k if v == max}
    res
end