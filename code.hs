data Lens s a = Lens {
    get :: s -> a
,   put :: s -> a -> s
}

type Name = String
type Age = Int

data Person = Person {
    name :: Name
,   age :: Age
} deriving Show

getName :: Person -> Name
getName = name

setName :: Person -> Name -> Person
setName p n = p { name = n }

nameL :: Lens Person Name
nameL = Lens getName setName

p :: Person
p = Person { name ="Mike", age= 21}

main :: IO ()
main  = do
    putStrLn "We have a person with the definition\n"
    print p >> putStrLn "\n"
    putStrLn "Let's see what happens when we get the name\n"
    putStrLn $ get nameL p
    putStrLn "\n"
    putStrLn "Now we want to see the new person after changing the name to Jordan\n"
    print $ put nameL p "Jordan"

