Haskell has lots of build-in functions which are defined in library called `standard prelude`

###  Functions that operates on lists
```
head [1,2,3,4,5]
tail [1,2,3,4,5]
indexing: [1,2,3,4,5] !! 2
slicing first n elements: take 3 [1,2,3,4,5]
remove first n elements: drop 3 [1,2,3,4,5]
length: length [1,2,3,4,5]
sum: sum [1,2,3,4,5]
product: product [1,2,3,4,5]
extend list: [1,2,3] ++ [4,5]
reverse list: reverse [1,2,3,4,5]

```
###  Function application 
```
f(x)        ->  f x
f(x,y)      ->  f x y 
f(g(x))     ->  f (g x)
f(x, g(y))  ->  f x (g y)
f(x)g(y)    ->  f x * g y
```

###  Functions with indentation 
```
a = b + c 
    where 
        b = 1
        c = 2
d = a * 2
```
same as
```
a = b + c 
    where 
        {b = 1;
        c = 2};
d = a * 2
```
and same as
```
a = b + c where {b = 1; c = 2}; d = a * 2 
        
d = a * 2
```
###  Functions with indentation 
```
2 ^ (3 * 4)
2 * (3 + 4) * 5
2 + 3 * 4 ^ 5
```

###  One line functions
```
n = a `div` length xs where { a = 10; xs = [1,2,3,4,5]};
```

### The library function `last` selects the last element of non-empty list; for example:
``` last [1,2,3,4,5] -> 5```

how this function can be defined in terms of the library functions that you know.

```
my_last xs = xs !! (length xs -1)
```
TRY BETTER: ```ghci last_implementation.hs ```


### The library function `init` remove the last element of non-empty list; for example:
``` last [1,2,3,4,5] -> [1,2,3,4]```

how this function can be defined in terms of the library functions that you know.

```
my_init xs = reverse (drop 1 (reverse xs))
```

### What are the types of the following values?
```
['a', 'b', 'c']             -> [Char]
('a', 'b', 'c')             -> (Char, Char, Char)
[(False, '0'), (True, '1')] -> [(Bool, Char)]
([False, True], ['0', '1']) -> ([Bool], [Char])
[tail, init, reverse]       -> [[a] -> [a]]
```

### Write down the definitions that hace the following types; it does not matter what the definition actually do as long as they are type correct
```
bools :: [Bool]
bools = [False, True]

nums :: [[Int]]
nums = [[8], [4], [8,7]]

add :: Int -> Int -> Int -> Int
add x y z = x + y + z 

copy :: a -> (a,a)
copy x = (x, x)

apply :: (a -> b) -> a -> b
apply f x = f x 
```
### What types are the following functions?
To check your answert use `:type second` in ghci.
```
second xs = head (tail xs)
second :: [a] -> a
:type second

swap (x,y) = (y, x)
swap :: (b, a) -> (a, b)

pair x y = (x, y)
pair :: a -> b -> (a, b)

double x = 2 * x 
double :: a -> a -> a

palindrome xs = reverse xs == xs
palindrome :: xs -> [a] -> Bool

twice f x = f (f x) 
twice :: (x -> x) -> x -> x
```
### Why it is not feasible in general for the function types to be instances of the Eq class? When it is feasible? 
Hint: The functionsof the same type are equal if they always return equal results for equal arguemtns.

### Using library functions, define a function `halve :: [a] -> ([a], [a])` that splits even-lengthed list into two halves.
```
halve x  = if length x `mod` 2 == 0
    then (take (length x `div` 2) x, drop (length x `div` 2) x)
    else (x, [])
```
### Define a function `third :: [a] -> a` that returns the third element in a list that contains at least this many elements using.
a) head and tail
```
third x = head ( tail (tail x))
```
b) list indexing !!
```
third x = x !! 2
```
c) pattern matching
```
third (_: _: x: _) = x
```
### Consider the function `safetail :: [a] -> [a]` that behaves in the same way as `tail` except that it maps the empty list to itself rather than producing an error.
a) try a conditional expression
```
safetail x = if length x > 0 then tail x else []
```
b) guarded equations
```
safetail x | length x > 0  = tail x
           | otherwise     = []
```
c) pattern matching
```
safetail [] = []
safetail x = tail x
```
### In a similar way to && show how the disjunction operator `||` can be defined in fourdifferent ways using pattern matching
```
True    || True     = True
True    || False    = True
False   || True     = True
False   || False    = False

False   || False    = False
_       || _        = True

False   || b        = b
True    || _        - True
```
### Without usin any other library functions or operators,show how the meaning of the following pattern matching definition for logical conjunction `&&` can be formalised using conditional expressions:
```
True    && True = True
_       && _    = False

conjunction x y = if x == True && y == True then True else False
```
### Show the meaning of the following curried function definition can be formalised in terms of lambda expressions:
```
mult :: Int -> Int -> Int -> Int
mult x y z = x * y * z

mult = \x -> (\y -> ( \z -> x * y * z))
```
### Implement the Luhn algorithm for checking if check bank card numbers are valid
```
double = (*) 2

luhnDouble x = if 2 * x > 9 then (2 * x - 9) else 2 * x

luhnDouble x | x > 4        = double x - 9
             | otherwise    = double x

luhn x y z v =  (luhnDouble x + y + luhnDouble z + v)`mod` 10 == 0
```


