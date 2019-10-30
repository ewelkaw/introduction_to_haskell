import Data.Char
import Data.List

votes :: [String]
votes = ["red", "blue", "green", "blue", "blue", "red"]

count_votes :: Eq a => a -> [a] -> Int
count_votes x = length . filter (==x) 

rmdups :: Eq a => [a] -> [a]
rmdups [] = []
rmdups (x:xs) = x : filter (/=x) (rmdups xs) 

result :: Eq b => [b] -> [(Int, b)]
result vs = sortOn fst [(count_votes v vs, v) | v <- rmdups vs]

-- winner = snd ( last (result votes))
winner :: Ord a => [a] -> a
winner = snd . last . result 