### Introduction to haskell programming based on book `Programming in Haskell` by `Graham Hutton`. 

### 1. **Instalation:**
```curl https://get-ghcup.haskell.org -sSf | sh```

and paste at the bottom of ~/.bash_profile line:

`source /Users/ewelina/.ghcup/env`
 
and in new terminal:

 ```ghci```

ghci - Glasgow Haskell Compiler interactive interpreter

### 2. **Agenda:**
1. Basic concepts:
    - Introduction
    - First steps
    - Types and classes
    - Defining functions
    - List comprehensions
    - Recursive functions 
    - Higher-order functions
    - Declaring types and classes
    - The countdown problem

## 3. BASIC INFO
- ghci sctipt.hs - imports script
- :reload - reloads loaded script

## 4. HASKELL KEYWORDS
- case
- class 
- data
- default
- deriving
- do 
- else 
- foreign
- if 
- import
- in 
- infix
- infixl
- infixr
- instalce
- let
- module
- newtype
- of
- then
- type
- where

## 5. Tabs
It is not recommended to use tabs but if someone prefer to do so we should keep in mind that Haskell assumes that tab stops are 8 character wide.

## 6. Comments
```
-- comment that will be ignored by the compiler
```

```
{-
nested
comments
-}
```

## 7. TYPES
- **Bool:** True, False

- **Char:** single character

- **Int:** fixed precision integer (from ```-2**63``` to ```2**63-1```) going outside this range can give unexpected results, saves some memory

- **Integer:** arbitrary-precision integers, contains all integers with as much memory as needed 

- **Float:** single precision floating-point number

- **Double:** double precision floating-point number, it is similar to float except twice as much memory is used for storage of these numbers to increase their precision

- **List:** is the sequence of elements of same type, with the elements being enclosed in square parantheses and separated by commas.
```
[True, True, False] :: [Bool]
['a', 'b', 'c', 'd'] :: [Char]
["One", "Two", "Three"] :: [String]
[['a', 'b'], ['c', 'd', 'e']] :: [[Char]]
```
- **Tuple:** is a finite sequence of componenetsof possibly different types with the components being enclosed in round parantheses and separated by commas.
```
(False, True) :: (Bool, Bool)
(False, 'a', True) :: (Bool, Char, Bool)
('Yes', True, 'a') :: (String, Bool, Char)
('Yes', ('a', False)) :: (String, (Char, Bool))
(['Yes', 'No'], [True, False]) :: ([String], [Bool])
[('a', False),('b', True)] :: [(Char, Bool)]
```
- **Function types:** is a mapping from arguments of one type to results of another type
```
even :: Int -> Bool

add :: (Int, Int) -> Int
add (x,y) = x+y

zeroto :: Int -> [Int]
zeroto n = [0..n]
```
- **Functions that operates on lists**
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
- **Function application**
```
f(x)        ->  f x
f(x,y)      ->  f x y 
f(g(x))     ->  f (g x)
f(x, g(y))  ->  f x (g y)
f(x)g(y)    ->  f x * g y
```

- **Curried functions:** functions which are free to return functions as result
```
add' :: Int -> (Int -> Int)
add' x y = x + y
```
- **Polymorphic types:** a good example of such type is function `length` which calculates the length of list no matter what type of data is inside. Other examples: fst, head, take, zip, id
```
length [1,3,5,7]
length ["Yes", "No"]
length [sin, cos, tan]
```
- **Overloaded types:** a good example of such type is operation `+` which calculates sum of any two numbers of the same numeric types
```
1 + 2
1.0 + 2.0
``` 
- **Basic classes:** is a collection of basic classes that are build-in to the language
    1. Eq - equality types:
    ```
    (==) :: a -> a -> Bool
    (/=) :: a -> a -> Bool

    False == False
    [1,2,3] == [1,2]
    ```
    2. Ord - orderred types
    ```
    (<) :: a -> a -> Bool
    (<=) :: a -> a -> Bool
    (>) :: a -> a -> Bool
    (>=) :: a -> a -> Bool
    min :: a -> a -> Bool
    max :: a -> a -> Bool

    True > False
    "elegant" < "elephant"
    ```
    3. Show - showable types, can be converted from  other types tp string
    ```
    show :: a -> String

    show False
    show 'a'
    show 123
    show ('a', False)
    ```
    4. Read - redable types, can be converted from strings to other types
    ```
    read :: String -> a
    read "False" :: Bool
    read "123" :: Int
    ```
    5. Num - numeric types
    ```
    (+) :: a -> a -> a
    (-) :: a -> a -> a
    (*) :: a -> a -> a
    negate :: a -> a
    abs :: a -> a
    signum :: a -> a
    signum -> it returns -1 for negative numbers, 0 for zero, and 1 for positive numbers

    1 + 2
    1.0 + 2.0
    negate 3.0
    abs (-3)
    signum (-3)
    ```
    6. Integral - integral types, fo integers
    ```
    div :: a -> a -> a
    mod :: a -> a -> a

    7 `div` 2
    7 `mod` 2
    ```
    7. Fractional - fractional types
    ```
    (/) :: a -> a -> a
    recip :: a -> a
    recip -> returns 1 / argument

    7.0 / 2.0
    recip 2.0
    ```
## 8. Functions
```
even :: Integral a -> a -> a Bool
even n = n 'mod' 2 == 0
```
- **Conditional expressions**
```
abs :: Int -> Int
abs n = if n >= 0 then n else -n

signum : Int -> Int 
signum n = if n < 0 then -1 else
                if n  == 0 then 0 else 1
```

- **Guarded equations**
It is an alternative to using conditional expressions, this is a sequence of logical expressions which are used to choose between a sequence of results of the same type.
```
abs n | n >= 0  = n
      | otherwise = -n

signum n | n < 0    = -1
         | n > 0    = 1
         | otherwise = 0
```

- **Pattern matching**
```
not :: Bool -> Bool -> Bool
not False = True
not True = False

(&&) :: Bool -> Bool -> Bool
True && True    = True
True && False   = False
False && True   = False
False && False  = False

True && b = b
False && _ = False
```
- **Tuple patterns**
```
fst :: (a, b) -> a
fst (x, _) = x
```
- **List patterns**
```
test :: [Char] -> Bool
test ['a', _, _]] = True
test _ = False
```
- **Lambda expressions**
(`\` -> lambda)  
```
\x = x + x
(\x = x + x) 2          ### result: 4

add x y = x + y
add = \x -> (\y -> x + y)

odds :: Int -> [Int]
odds n = map f [0..n-1]
         where f x = x * 2 + 1

odds n = map (\x -> x * 2 + 1) [0 .. n-1]
```
- **Operator sections** it means that function can be formalised  using lambd expression
```
(+)     -->     \x -> (\y -> x + y)
(1+)    -->     \y -> 1 + y
(1/)    -->     \y -> 1 / y 
(*2)    -->     \x -> x * 2
(/2)    -->     \x -> x / 2
```