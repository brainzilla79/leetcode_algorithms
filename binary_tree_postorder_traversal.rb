# Given a binary tree, return the postorder traversal of its nodes' values.

# Example:

# Input: [1,null,2,3]
#    1
#     \
#      2
#     /
#    3

# Output: [3,2,1]
# Follow up: Recursive solution is trivial, could you do it iteratively?

def traverse(root, ar)
    if root
        traverse(root.left, ar)
        traverse(root.right, ar)
        ar << root.val
    end 
end 

def postorder_traversal(root)
    ar = []
    traverse(root, ar)
    ar
end