require_relative 'test_helper'

class TestMeme < MiniTest::Unit::TestCase

  def setup
    @trie = Trie.new
  end

  def test_tree_empty_on_new
    assert_equal({ 'root' => {} }, @trie.tree)
  end

  def test_adding
    @trie.insert('tea')
    assert_equal({ 't' => { 'e' => {'a' => {}}}}, @trie.tree['root'])
  end

  def test_adding_duplicate
    @trie.insert('tea')
    expected = { 't' => { 'e' => {'a' => {}}}}
    assert_equal(expected, @trie.tree['root'])
    @trie.insert('tea')
    assert_equal(expected, @trie.tree['root'])
  end

  def test_find_existing
    @trie.insert('tea')
    @trie.insert('ten')
    assert_equal('t', @trie.find('t'))
    assert_equal('te', @trie.find('te'))
    assert_equal('tea', @trie.find('tea'))
    assert_equal('ten', @trie.find('ten'))
  end

  def test_find_non_existing
    @trie.insert('tea')
    assert_equal(nil, @trie.find('apple'))
  end

end
