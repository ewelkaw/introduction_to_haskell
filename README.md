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
- **Bool:**
True, False
- **Char:** single character
- **Int:** fixed precision integer (from ```-2**63``` to ```2**63-1```) going outside this range can give unexpected results, saves some memory
- **Integer:** arbitrary-precision integers, contains all integers with as much memory as needed 
- **Float:** single precision floating-point number
- **Double:** double precision floating-point number, it is similar to float except twice as much memory is used for storage of these numbers to increase their precision
- **List:**
