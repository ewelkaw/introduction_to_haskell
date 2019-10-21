-- Implement your own init function using only `reverse` and `drop` functions.

my_init xs = reverse (drop 1 (reverse xs))
