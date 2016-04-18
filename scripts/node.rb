class Node
	attr_accessor :node, :next

  # Initializing an object with value and pointer to next defaults to nil
	def initialize(node)
		@node = node
		@next = nil
	end

  # List all the nodes in a list
	def self.node_list(node, msg = nil)
		msg ||= ""
		return msg[0...-4] if node.nil?
		node_list(node.next, msg << "#{node.node} -> ")
	end

  # Reverse all the elements in the list
  # @param node [Node] the node list to be returned
  # @return [Node] reversed input
	def self.reverse_list(node)
		return node if node.next.nil?
    head, swap, node.next = node.next, node, nil
   
    right = head.next

    while right != nil
    	head.next = swap
    	swap = head
    	head = right
    	right = right.next
    end

    head.next = swap
    head
  end

  def last
  	node = @node
  	return node if node.next.nil?
  	node = last node.next
  end

  # Insert a node in the position specified
  # @param parent_node [Node]: The first node in the list
  # @param node [Node]: The node to be inserted
  # @param position [Fixnum]: Position at which it should be inserted. 
  # @return [Node] the parent_node with the node inserted
  def self.insert_node(parent_node, node, position)
  	return -1 if parent_node.next.nil?
  	pos = 0
  	flag = true
  	head = parent_node
  	right = head.next
  	while pos <= position
      pos +=1
  		if position == pos
  			head.next = node
  			node.next = right
  			flag = false
  		else
  			head = right
  			right = head.next
  		end
  	end
  	raise "Position #{position} not found for #{parent_node.node}" if flag
  	parent_node
  end

  # Delete node that matches the element provided
  # returns parent_node after deletion
  # @param parent_node [Node] first node in the list
  # @param node_element [Object] the value of the node that you want to delete. 
  # @return [Node] the original node with the element removed
  def self.delete_node(parent_node, node_element)
  	return -1 if parent_node.next.nil?
  	head = parent_node
  	right = head.next
  	flag = true
  	while flag
  		if right.node == node_element
  			head.next = right.next
  			right.next = nil
  		  flag = false
  		else
  			head = right
  			right = head.next
  		end
  	end
  	raise "could not find #{node_element} in the list" if flag
  	parent_node
  end
end
