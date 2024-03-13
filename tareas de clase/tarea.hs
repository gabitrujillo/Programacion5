--2.
ejercicio1 :: Int
ejercicio1 = (2^3) * 4

ejercicio2 :: Int
ejercicio2 = (2*3)+(4*5)

ejercicio3 :: Int
ejercicio3 = 2+(3*(4^5))

--3.
n = a `div` length xs
  where 
    a = 10
    xs = [1,2,3,4,5]

--4.
last :: [a] -> a
last [x] = x
last xs = head (reverse xs)
-- 5.
init1 :: [a] -> [a]
init1 [_]    = []
init1 (x:xs) = x : init1 xs

init2 :: [a] -> [a]
init2 xs = take (length xs - 1) xs
