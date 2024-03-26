module Example where


eitherToMaybe :: Either b a -> Maybe a 
eitherToMaybe e =
    case e of
        Left _ -> Nothing
        Right val -> Just val


--handleMissRight :: Either String (Maybe a ) -> Either String a
--handleMissRight e =
   -- case e of
    --Left err -> Left "Esta mal"
   -- Right Nothing -> Left "Sos especial"
    --Right (Just val) -> Right val

handleMissRight :: Either Int String -> Either String String
handleMissRight e =
    case e of
    Left err -> Left "Esta mal"
    Right "" -> Left "Sos especial"
    Right e -> Right e


--handleMissRight :: Either Int String -> Either Int String
--handleMissRight e =
   -- case e of
    --Left err -> Left 0
    --Right "" -> Left 0
    --Right e -> Right e
    
---------Fold example--------------------------------
sumList :: [Int] -> Int
sumList = foldr (+) 0
------------------------Ejercicio 12/03 ejemplo de curried------------------------
add :: Int -> (Int -> Int)
add x y = x+y

resultado :: Int
resultado = (add 5) 8
