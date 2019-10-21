-- Implement the `Luhn algorithm`, which is used to check bank card numbers.
-- Proceeds as follows:
--     - consider each digit as a separete number;
--     - moving left, double every other number from the second last;
--     - subtract 9 from each number that is now greater than 9;
--     - add all the resulting numbers together;
--     - if the total is divisible by 10 the card number is valid.

double = (*) 2

luhnDouble x | x > 4        = double x - 9
             | otherwise    = double x

luhn x y z v =  (luhnDouble x + y + luhnDouble z + v) `mod` 10 == 0