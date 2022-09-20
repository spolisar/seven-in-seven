class Tree
    attr_accessor :children, :node_name
    
    def initialize(name, children=[])
        @children = children
        @node_name = name
    end
    
    def visit_all(&block)
        visit &block
        children.each {|c| c.visit_all &block}
    end
    
    def visit(&block)
        block.call self
    end
end

ruby_tree = Tree.new( "Ruby" , 
    [Tree.new("Reia" ),
     Tree.new("MacRuby" )] )
puts "Visiting a node"
ruby_tree.visit {|node| puts node.node_name}
puts
puts "visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}

class HashTree
    attr_accessor :children, :node_name
    
    def initialize(starter)
        @node_name = starter.keys[0]
        @children = starter.values[0].map {|k, v| HashTree.new(Hash[k, v])}
    end
    
    def visit_all(&block)
        visit &block
        children.each {|c| c.visit_all &block}
    end
    
    def visit(&block)
        block.call self
    end
end

ext_tree = HashTree.new({'grandpa' => {'dad' => {'child 1' => {}, 
                                                'child 2' => {} }, 
                                      'uncle' => {'child 3' => {}, 
                                                  'child 4' => {}}}})

puts "Visiting a node"
ext_tree.visit {|node| puts node.node_name}
puts
puts "visiting entire tree"
ext_tree.visit_all {|node| puts node.node_name}