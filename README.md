trie-rb
=======

[![Build Status](https://travis-ci.org/mtchavez/trie-rb.png)](https://travis-ci.org/mtchavez/trie-rb)

Fredkin trie algorithm in Ruby


## Usage

Initialize a tree

```ruby
trie = Trie.new
p trie.tree
# {"root"=>{}}
```

Insert some terms

```ruby
%w[to tea ten ted A in inn].each { |term| trie.insert(term) }
p trie.tree
# {"root"=>{"t"=>{"o"=>{}, "e"=>{"a"=>{}, "d"=>{}, "n"=>{}}}, "A"=>{}, "i"=>{"n"=>{"n"=>{}}}}}
```

## Tests

Run tests using ```rake```

## License

Written by Chavez

Released under the MIT License: http://www.opensource.org/licenses/mit-license.php
