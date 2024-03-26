--data Shape = Circle Float | Rect Float Float -- driving Show  Ord


--data MyList a = Nil | Cons a (MyList a) driving Show -- reciva un elemento de a
data Maybe a = Nothing | Just a

zero_1 :: Maybe Int
zero-1 = Just 0

app :: (a -> b) -> Maybe a -> Maybe b
app f Nothing = Nothing
app f (Just x) = Just (f x)

-- Ghci:  app (| x -> x +1) (Just 1)
  --------app               (Nothing)
  --------app(|x -> 'a' :x )
  --------app (| x -> 'a' :x) (Just "test")