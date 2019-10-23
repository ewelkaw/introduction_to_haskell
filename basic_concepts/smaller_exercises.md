## **Agenda:**
1. Basic concepts:
    - [Introduction](#1-INTRODUCTION)
    - [Types and classes](#2-TYPES-AND-CLASSES)
    - [Defining functions](#3-DEFINING-FUNCTIONS)
    - [List comprehensions](#4-LIST-COMPREHENSIONS)
    - [Recursive functions](#5-RECURSIVE-FUNCTIONS)
    - [Higher-order functions](#6-HIGHER-ORDER-FUNCTIONS)
    - [Declaring types and classes](#7-DECLARING-TYPES-AND-CLASSES)
    - [The countdown problem](#8-THE-COUNTDOWN-PROBLEM)

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
```haskell
a = b + c 
    where 
        b = 1
        c = 2
d = a * 2
```
same as
```haskell
a = b + c 
    where 
        {b = 1;
        c = 2};
d = a * 2
```
and same as
```haskell
a = b + c where {b = 1; c = 2}; d = a * 2 
        
d = a * 2
```
###  Functions with indentation 
```haskell
2 ^ (3 * 4)
2 * (3 + 4) * 5
2 + 3 * 4 ^ 5
```

###  One line functions
```haskell
n = a `div` length xs where { a = 10; xs = [1,2,3,4,5]};
```
## 1. INTRODUCTION

### The library function `last` selects the last element of non-empty list; for example:
``` last [1,2,3,4,5] -> 5```

### how this function can be defined in terms of the library functions that you know.

```haskell
my_last xs = xs !! (length xs -1)
```
TRY BETTER: ```ghci last_implementation.hs ```

### The library function `init` remove the last element of non-empty list; for example: 
``` last [1,2,3,4,5] -> [1,2,3,4]``` 

### how this function can be defined in terms of the library functions that you know.

```haskell
my_init xs = reverse (drop 1 (reverse xs))
```
## 2. TYPES AND CLASSES

### What are the types of the following values?
```haskell
['a', 'b', 'c']             -> [Char]
('a', 'b', 'c')             -> (Char, Char, Char)
[(False, '0'), (True, '1')] -> [(Bool, Char)]
([False, True], ['0', '1']) -> ([Bool], [Char])
[tail, init, reverse]       -> [[a] -> [a]]
```

### Write down the definitions that hace the following types; it does not matter what the definition actually do as long as they are type correct
```haskell
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
```haskell
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

## 3. DEFINING FUNCTIONS

### Using library functions, define a function `halve :: [a] -> ([a], [a])` that splits even-lengthed list into two halves.
```haskell
halve x  = if length x `mod` 2 == 0
    then (take (length x `div` 2) x, drop (length x `div` 2) x)
    else (x, [])
```
### Define a function `third :: [a] -> a` that returns the third element in a list that contains at least this many elements using.
a) head and tail
```haskell
third x = head ( tail (tail x))
```
b) list indexing !!
```haskell
third x = x !! 2
```
c) pattern matching
```haskell
third (_: _: x: _) = x
```
### Consider the function `safetail :: [a] -> [a]` that behaves in the same way as `tail` except that it maps the empty list to itself rather than producing an error.
a) try a conditional expression
```haskell
safetail x = if length x > 0 then tail x else []
```
b) guarded equations
```haskell
safetail x | length x > 0  = tail x
           | otherwise     = []
```
c) pattern matching
```haskell
safetail [] = []
safetail x = tail x
```
### In a similar way to && show how the disjunction operator `||` can be defined in fourdifferent ways using pattern matching
```haskell
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
```haskell
True    && True = True
_       && _    = False

conjunction x y = if x == True && y == True then True else False
```
### Show the meaning of the following curried function definition can be formalised in terms of lambda expressions:
```haskell
mult :: Int -> Int -> Int -> Int
mult x y z = x * y * z

mult = \x -> (\y -> ( \z -> x * y * z))
```
### Implement the Luhn algorithm for checking if check bank card numbers are valid
```haskell
double = (*) 2

luhnDouble x = if 2 * x > 9 then (2 * x - 9) else 2 * x

luhnDouble x | x > 4        = double x - 9
             | otherwise    = double x

luhn x y z v =  (luhnDouble x + y + luhnDouble z + v)`mod` 10 == 0
```
## 4. LIST COMPREHENSIONS

### Using a list comprehension, give an expression that clculates the sum of 100 first integer squares.
```haskell
sum [x^2 | x <- [1..100]]
```
### Suppose that a coordinate grid of size `m x n` is given by the list of pairs `(x, y)` of integers that `0 <= x <= m` and `0 <= y <= n` using a comprehensio defina a function `grid :: Int -> Int -> [(Int, Int)]`
```haskell
grid m n = [(x, y) | x <- [0..m], y <- [0..n]] 
grid 1 2
```
### Using the list cmprehension and the function grid above, define a function `square :: Int -> [(Int, Int)]`that returns a coordinate square of a size n, excluding the diagonal from (0,0) to (n,n)
```haskell
square n = [(x, y) | x y <- grid n n, x /= y]
square 2
```
### In a similar way to the function length show how the library function `replicate :: Int -> a -> [a]` that produces a list of identical elements can be defined using a list comprehension
```haskell
replicate n m = [m | _ <- [1..n]]
```
### A triple (x,y,z) of positive integers in Pythagorean if it satisfies the equation `a^2 + b^2 = c^2`. Using a list comprehension with three generators, define a function `pyths :: Int -> [(Int, Int, Int)]` that returns the list of all such triples whose componenets are at most a given limit
```haskell
pyths m = [(a, b, c) | a <- [1..m], b <- [1..m], c <- [1..m], a^2 + b^2 == c^2] 
```
### A positive integer is perfect if it equals the sum of all of its factors, excluding the number itself. Using a list comprehension and the function factors, define a function `perfects :: Int -> [Int]` that returns the list of all persect numbers up to a given limit
```haskell
factors n = [x | x <- [1..n], n `mod` x == 0]
perfects n = [x | x <- [1..n], sum (factors x) - x == x]
perfects 500
```
### Prepare a function `scalarproduct :: [Int] -> Int` which produces a scalar product of two lists
```haskell
scalarproduct x y = sum [a * b | (a, b) <- zip x y]
scalarproduct [1,2,3] [4,5,6]
```
## 5. RECURSIVE FUNCTIONS

### How does the recursive version of the factorial function behave if applied to a negative arguments by adding a guard th the recursive case.
```haskell
factorial n | 0 = 1
            | n > 0 = n * factorial (n-1)
```
### Define a recursive function `sumdown :: Int -> Int` that returns the sum of the non-negative integers from a given value down to zero. For example, `sumdown 3` should return the result `3+2+1+0=6`
```haskell
gdci sumdown.hs
-- sumdown (-1)
-- sumdown 3
```
### Define the exponential operator (^) for non negative integers
```haskell
ghci exponential.hs 
-- exponential 2 3
-- exponential 2 0
```
### Define a recursive function `euclid :: Int -> Int -> Int` which calculates the greatest common divisor of two non-negative integers. If two numbers are equal then this number is a resultm otherwise the smaller number is subtracted from the larger and the process is the repeated
`https://codility.com/media/train/10-Gcd.pdf`
```haskell
ghci greatest_common_divisor.hs 
-- euclid 6 27
```
### Using the recursive definitions given in this chapter, show how `length [1,2,3], drop 3 [1,2,3,4,5], init [1,2,3]` are evaluated.
- LENGTH
```haskell
length2 [] = 0
length2 (x:xs) = 1 + length2 xs
```
- DROP
```haskell
drop2 n [] = []
drop2 0 xs = xs
drop2 n (x:xs) = drop2 (n-1) xs
```
- INIT
```haskell
init2 [] = []
init2 (_:[]) = []
init2 (x:xs) = [x] ++ init2 xs
```
### Without looking at the definitions from the standard prelude, define the following library functions on list using recursion:
- and :: [Bool] -> Bool
```haskell
and2 [] = True
and2 (x:xs) | x == True    = and2 xs 
            | otherwise    = False
```
- concat :: [[a]] -> [a]
```haskell
concat2 [] = []
concat2 [[]] = []
concat2 (x:xs) = x ++ concat2 xs
```
- replicate :: Int -> a -> [a]
```haskell
replicate2 0 _ = []
replicate2 n x = [x] ++ replicate2 (n-1) x
```
- elem :: Eq a -> a -> [a] -> Bool 
```haskell
elem2 y [] = False
elem2 y (x:xs)  | y == x        = True
                | otherwise     = elem2 y xs
```
### Define a recursive function `merge :: Ord a -> [a] -> [a] -> [a]` that implements merge sort, so merges two sorted lists
```haskell
merge2 xs [] = xs
merge2 [] xs = xs
merge2 (x:xs) (y:ys)    | x <= y    = x : merge2 xs (y:ys)
                        | otherwise = y : merge2 (x:xs) ys
<!-- merge2 [1,2,3] [1,23] -->
```
### Using the five-step process, construct the library functions that:
- calculate the `sum` of a list of numbers;
```haskell
sum2 [] = 0
sum2 (x:xs) = x + sum2 xs 
<!-- sum2 [] -->
<!-- sum2 [1,2,3,7,4] -->
```
- `take` a given number of elements from the start of the list;
```haskell
take2 0 xs = []
take2 n [] = []
take2 n (x:xs) = [x] ++ take2 (n-1) xs
<!-- take2 0 [1,2,3] -->
<!-- take2 2 [1,2,3] -->
<!-- take2 2 [] -->
```
- select the `last` element of a non-empty list
```haskell
last2 [x] = x
last2 (x:xs) = last2 xs
<!-- last2 [1] -->
<!-- last2 [1,2,3] -->
```
## 6. HIGHER ORDER FUNCTIONS

## 7. DECLARING TYPES AND CLASSES

## 8. THE COUNTDOWN PROBLEM