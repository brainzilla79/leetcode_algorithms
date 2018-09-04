# You are given two non-empty linked lists representing two non-negative integers. The most significant digit comes first and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

# You may assume the two numbers do not contain any leading zero, except the number 0 itself.

# Follow up:
# What if you cannot modify the input lists? In other words, reversing the lists is not allowed.

# Example:

# Input: (7 -> 2 -> 4 -> 3) + (5 -> 6 -> 4)
# Output: 7 -> 8 -> 0 -> 7

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def convert_list_to_int(head)
    str = ''
    curr = head 
    while curr 
        str += curr.val.to_s 
        curr = curr.next
    end 
    str.to_i
end 

def add_two_numbers(l1, l2)
    sum = convert_list_to_int(l1) + convert_list_to_int(l2)
    head = nil 
    prev = nil 
    sum.to_s.split('').each do |digit| 
        node = ListNode.new(digit)
        head = node if head.nil?
        prev.next = node if prev
        prev = node 
    end 
    head
end