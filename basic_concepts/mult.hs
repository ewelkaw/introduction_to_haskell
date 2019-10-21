-- Using lambda expressions prepare function that multiplies three given values.

mult = \x -> (\y -> ( \z -> x * y * z))