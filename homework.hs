module TorresDeHanoi where
type NumeroDiscos = Int
type Vara = String
type Movimiento = (Vara, Vara)

hanoi :: NumeroDiscos -> Vara -> Vara -> Vara -> [Movimiento]
hanoi 0 _ _ _ = [] 
hanoi n origen destino temporal =
    
    hanoi (n - 1) origen temporal destino ++
    [(origen, destino)] ++
    hanoi (n - 1) temporal destino origen

imprimirMovimiento :: Movimiento -> String
imprimirMovimiento (desde, hacia) = "Mover desde " ++ desde ++ " hacia " ++ hacia


imprimirMovimientos :: [Movimiento] -> String
imprimirMovimientos [] = ""
imprimirMovimientos (x:xs) = imprimirMovimiento x ++ "\n" ++ imprimirMovimientos xs
