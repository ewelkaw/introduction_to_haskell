-- safetail x | length x > 0  = tail x
--            | otherwise     = []

safetail [] = []
safetail x = tail x