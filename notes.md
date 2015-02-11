### Setup
`brew install ghc`
`brew install cabal-install`

### GHCi
- Use the `let` keyword to define a name in ghci.  Entering `let a = 1` in ghci is the same as writing a = 1 in a script, then loading it with `:l`
- You can put code into `baby.hs` file and load it in GHCi: `ghci` then `:l baby`

### Functions
- Define like `doubleMe x = x + x`

### Basic Lists
- Items in lists are all of one type (string, integer, etc) `[4,8,15]`
- Concatenation. `++`
- `++` always takes two lists as arguments
- `[1,2,3] ++ [9,10,11]` => `[1,2,3,9,10,11]`
- `"hi" ++ " " ++ "there"` => `"hi there"`
- `['w','o'] ++ ['o','t']` => `"woot"`
- Don't use `++` on long strings because it has to walk through the entire string.
- Strings are just lists of characters
- Prepend using the cons operator `:`
- `'A':" SMALL CAT"` => `"A SMALL CAT"` (prepend a character to a list of characters)
- `5:[1,2,3,4]` => `[5,1,2,3,4]` (prepend an integer to a list of integers)
- `[1,2,3]` is syntactic sugar for `1:2:3:[]`
- You can have lists within lists
- You cannot have a list of different list types (integer, character, etc)

### Accessing List items
- Use `!!` to get by index position
- `"Steve" !! 3` => `'v'`

### Comparing Lists
- Lists can be compared if the items they contain can be compared
- `[3,4,2] < [3,4,3]` The first list is smaller than the second list.  It compares each item in sequence and when it reached index 2, compared 2 < 3
- A nonempty list is always considered greater than an empty one
- `head [5,4,3,2,1]` => `5` (returns first)
- `tail [5,4,3,2,1]` => `[4,3,2,1]` (returns all but head)
- `last [5,4,3,2,1]` => `1` (returns last)
- `init [5,4,3,2,1]` => `[5,4,3,2]` (returns all but last)
- Don't call the above on an empty list!
- `length [5,4,3,2,1]` => `5` (returns item count)
- `null [5,4,3,2,1]` => `false`
- `null []` => `true`
- `take 2 [4,5,6,7]` => `[4,5]`
- `take 1 [4,5,6,7]` => `[4]`
- `drop 2 [4,5,6,7]` => `[6,7]`
- `maximum`, `minimum`, `reverse`, `sum`, `product`
- `4 ` \`elem\` `[3,4,5,6]` => `True` elem returns true if the item is in the list
- `10 ` \`elem\` `[3,4,5,6]` => `False`

### Ranges
- `[1..20]`
- `['a'..'z']`
- You can specify a 'step' -> `[2,4..20]` (count from 2 to 20 by 2s)
- You can specify a 'step' -> `[3,6..20]` (count from 3 to 18 by 3s)
- Downward ranges require a step -> `[20,19..1]`
- `[13, 26..24*13]` (a list containing the first 24 multiples of 13)
- `take 24 [13, 26..]` (take first 24 from an infinite range.  because haskell is lazy, it won't try to calculate the entire list immediately)
- `cycle` takes a list and replicates it infinitely
- `take 10 (cycle [1,2,3])` => `[1,2,3,1,2,3,1,2,3,1]`
- `take 5 (repeat 3)` => `[3,3,3,3,3]`
- `replicate 3 10` => `[10,10,10]` shortens this
- careful with floating point ranges

### List comprehensions
- (similar mathematically to set comprehensions)
- for example, '{2·x|x ∈ N, x ≤ 10}', means take all natural nums less than or equal to 10, multiply each one by 2 and use these results to create a new set
- in haskell, you can do `take 10 [2,4..]`
- or you can do a list comprehension in haskell: `[x*2 | x <- [1..10]]`
- its kind of like loop through 1-10 with x as the iterator and the `x*2` is what to do each time
- this is kind of like ruby 'map'
- `[x*2 | x <- [1..10], x*2 >= 12]` the last part is a condition or predicate
- it allows you to limit what shows up in the result set
- weeding out parts of lists using predicates is also called filtering
- `let xxs = [[1,3,5,2,3,1,2,4,5],[1,2,3,4,5,6,7,8,9],[1,2,4,2,1,6,3,1,3,2,3,6]]`
- `[ [ x | x <- xs, even x ] | xs <- xxs]` will take xxs and return all even nums keeping the nesting

### Tuples
- `(1, 3)`
- `(1, 2.3, "hello", 'a')`
- a tuple with 2 elements is considered a different type than a tuple with 3 elements
- this means a list can't be comprised of both pair and triple tuples
- this strictness is good and eliminates some complexity later on
- tuples of the same length but with different types of data are considered distinct
- for example, you cant do `[(1, 2), ('one', 2)]`
- we could use a tuple to represent a wide variety of data.  for example, you could represent someone's
- name and age as `("christopher", "walken", 55)`
##### Tuple functions
- `fst` returns the first component of a pair
- `snd` returns the second of a pair
- `zip` produces pairs from two lists
- `zip [1..5] [5,5,5,5,5]` => `[(1,5),(2,5),(3,5),(4,5),(5,5)]`
- if length of the lists don't match, it's like an inner join where items on the longer list are ignored
- lazy loading lets you zip on infinite lists
- `zip [1..] ['apple','orange','grape']` => `[(1,'apple'),(2,'orange'),(3,'grape')]`

### Types
- `::` can be read as 'has type of'
e.g. `:t 'a'` => `'a' :: Char`

we can choose to give functions explicit type declarations (good practice)
- `removeNonUppercase :: [Char] -> [Char]` (expect [char] and return [char])
- `removeNonUppercase st = [ c | c <- st, c \`elem\` ['A'..'Z']]`

- `addThree :: Int -> Int -> Int -> Int`
- `addThree x y z = x + y + z`


