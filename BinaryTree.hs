data Tree a = Leaf | Node Integer (Tree a) a (Tree a) deriving (Show, Eq)

foldTree :: [a] -> Tree a
foldTree = foldr insertTree Leaf

height :: Tree a -> Integer
height Leaf = -1
height (Node h _ _ _) = h

insertTree :: a -> Tree a -> Tree a
insertTree x Leaf = Node 0 Leaf x Leaf
insertTree x (Node _ left val right)
    | height left < height right = let newLeft = insertTree x left in Node (height newLeft + 1) newLeft val right
    | otherwise = let newRight = insertTree x right in Node (height newRight + 1) left val newRight


