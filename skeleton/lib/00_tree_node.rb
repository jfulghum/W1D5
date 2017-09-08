require 'byebug'

class PolyTreeNode
  attr_accessor :value, :children
  attr_reader :parent


  def initialize(value=nil)
    @value = value
    @children = []
    @parent = nil
  end

  def parent=(node)
    return if self.parent == node
    # return if node.children.include?(self)
    if self.parent
      self.parent.children.delete_if {|child| child == self}
    end
    @parent = node
    node.children << self unless node.nil? || node.children.include?(self)
  end

  def add_child(node)
    return if self.children.any? { |x| x == node}
    self.children << node
    node.parent = self
  end

  def remove_child(node)
    raise "This node is not a child" if node.parent.nil?
    node.parent = nil
    #why dont we have to delete from parent's child status?
  end

  def dfs(target_value)
    return nil if self.nil?
    return self if self.value == target_value
    self.children.each do |child|
      result = child.dfs(target_value)
      return result unless result.nil?
    end
    nil
  end

  def bfs(target_value) # FIFO
    queue = [self]
    # debugger
    until queue.empty?
      check = queue.shift
      return check if check.value == target_value
      queue += check.children
    end

  end



end
