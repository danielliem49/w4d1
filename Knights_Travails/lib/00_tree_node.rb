require 'byebug'

class PolyTreeNode
    
    attr_reader :parent, :children, :value

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end


    def parent=(node)
        # return @parent = nil if node == nil
        # debugger
        if parent != nil
            parent.children.delete(self)
        end
        return @parent = node if node == nil
        if !node.children.include?(self)
            node.children << self
        end

        @parent = node
    end

    def add_child(node)
        node.parent = self
        if !self.children.include?(node) 
            self.children << node
        end
    end

    def remove_child(node)
        node.parent = nil 
        raise "an error" if !self.children.include?(node)
        self.children.delete(node)
    end

    def dfs(target)
        return self if value == target
        children.each do |child|
            attempt = child.dfs(target)
            return attempt if attempt != nil
        end
        nil
    end

    def bfs(target)
        queue = []
        queue.push(self)
        until queue.length == 0
            ele = queue.shift
            return ele if ele.value == target
            queue += ele.children
        end
        nil
    end
    
end

a = PolyTreeNode.new(1)
b = PolyTreeNode.new(2)
c = PolyTreeNode.new(3)
p b.parent = (a)