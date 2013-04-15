class Trie

  attr_accessor :tree

  def initialize()
    @tree = {'root' => {}}
  end

  def insert(term)
    return @tree if term.nil? or term.empty?
    @tree['root'].merge(insert_into_tree(term, @tree['root']))
    @tree
  end

  def find(term)
    return nil if term.nil? or term.empty?
    find_in_tree(term, @tree['root'], term)
  end

private

  def insert_into_tree(term, node)
    return node if term.nil? or term.empty?
    key, remaining = term[0], term[1..-1]
    node[key] = {} unless node.has_key?(key)
    node[key].merge(insert_into_tree(remaining, node[key]))
  end

  def find_in_tree(term, node, orig, found='')
    return orig if orig == found
    return nil if term.nil? or term.empty?
    key, remaining = term[0], term[1..-1]
    return nil unless node.has_key?(key)
    find_in_tree(remaining, node[key], orig, found += key)
  end

end
