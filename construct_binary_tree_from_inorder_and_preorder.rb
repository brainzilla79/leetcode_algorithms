# Given preorder and inorder traversal of a tree, construct the binary tree.

# Note:
# You may assume that duplicates do not exist in the tree.

# For example, given

# preorder = [3,9,20,15,7]
# inorder = [9,3,15,20,7]
# Return the following binary tree:

#     3
#    / \
#   9  20
#     /  \
#    15   7

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {Integer[]} preorder
# @param {Integer[]} inorder
# @return {TreeNode}
def build_tree(preorder, inorder)
    return nil if preorder.empty? || inorder.empty?
    root_val = preorder.shift
    root = TreeNode.new(root_val)
    root_index = inorder.find_index(root_val)
    left_inorder = inorder.take(root_index)
    right_inorder = inorder.drop(root_index + 1)
    left_pre = preorder.take(left_inorder.length)
    right_pre = preorder.drop(left_inorder.length)
    root.left = build_tree(left_pre, left_inorder)
    root.right = build_tree(right_pre, right_inorder)
    root
end