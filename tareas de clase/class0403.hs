--Basic type
---
--Bool ::  true y false (logical values)
-- char  (single characters)
-- Stirng (string of charters )
--Int (fixed precision integers)
--Integer (arbitrary precision integer)
--Float (single precicion)
--Double ()

--en haskell podemo sdeclarar 
--datos sinonimos 
type Stirng = [char]

--ejemplo:
type name = Stirng
type age = Int
listOfStudents :: Stirng -> (name, age)

ejemplo:
type names = [Stirng]
typeListName = [(name , age)]

-- en haskell definimos nuestros popios de datos

data Bool = false | true

data MyBool = true | true
data MyBool = true | false

data Bool = ... | True -- (... no interesan , ES UN DATO SIMPLE )

-----------------------------------
type Stirng = [char]

--EJEMPLO:
data DaysOfWeek = Monday | Tuesday | ... | Friday

--tipos de datos uno o mas campos para recibir como parametro
data Shape = Cicle Float | Rect Float Float

---- Tipos de datos recursivos 
data List a = Nil | cons a (List a)

-----type clasess
class Eq a where
    (==) , (/=) ::a  -> a -> Bool
    x / = y = not (x == y)

---Ejemplo :
type nameString 
type age  = Int

data Person = Student name 
    |worker name Age 
    dearving Eq

--POLIFORMISMO  se va poder recivir varios tipos 

data Maybe a = Nothing | Just a

zero :: Maybe Int
zero = Just 0

app :: (a->b) -> Maybe a -> Maybe b
app f Nothing = Nothing
app f (Just x) = Just (f x)
-- Se usa cuando no se usa se pasa como parametro
--verifica que cada dato verifica el tipo que se le esta mandando ensu funcion 
--como poliformicos 
---------------------------------------------------------------------------------
--TYPE RECURSIVO
data Nat = zero | Succ Nat
-- Nat is a new type with constructors 
Zerro :: Nat and Succ :: Nat -> Nat


--type declaratuons 
--type classrsivos 
data List a = Nil | cons a (List a)



--AVERIGUAR COMO FUNCIONA (y) while Conbinator Y Boolr
--Grahan hutton
--COmputher Philia

 --averiguar 
