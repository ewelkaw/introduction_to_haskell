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