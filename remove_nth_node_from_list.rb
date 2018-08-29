# Given a linked list, remove the n-th node from the end of list and return its head.

# Example:

# Given linked list: 1->2->3->4->5, and n = 2.

# After removing the second node from the end, the linked list becomes 1->2->3->5.
# Note:

# Given n will always be valid.

# Follow up:

# Could you do this in one pass?

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}
def remove_nth_from_end(head, n)
    return nil if head.next.nil?
    count = 0
    front_point = head
    until count == n 
        front_point = front_point.next 
        count += 1
    end 
    
    back_point = head 
    prev = nil
    until front_point == nil 
        front_point = front_point.next
        prev = back_point
        back_point = back_point.next
    end 
    if !prev.nil? 
        prev.next = back_point.next
        return head
    else 
        return back_point.next
    end
end