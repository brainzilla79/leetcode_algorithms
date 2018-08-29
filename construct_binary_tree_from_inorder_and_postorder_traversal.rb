# Given inorder and postorder traversal of a tree, construct the binary tree.

# Note:
# You may assume that duplicates do not exist in the tree.

# For example, given

# inorder = [9,3,15,20,7]
# postorder = [9,15,7,20,3]
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

# @param {Integer[]} inorder
# @param {Integer[]} postorder
# @return {TreeNode}
def build_tree(inorder, postorder)
    return nil if inorder.empty? || postorder.empty?
    root_val = postorder.pop
    root = TreeNode.new(root_val)
    root_index = inorder.find_index(root_val)
    left_inorder = inorder.take(root_index)
    right_inorder = inorder.drop(root_index + 1)
    left_postorder = postorder.take(left_inorder.length)
    right_postorder = postorder.drop(left_inorder.length)
    root.left = build_tree(left_inorder, left_postorder)
    root.right = build_tree(right_inorder, right_postorder)
    root
    
end