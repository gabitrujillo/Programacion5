
-- 2.
data Student = Student String Int

-- Create a list of students from the given format
students :: [Student]
students = [Student "Ana" 25, Student "Jose" 37, Student "Maria" 23, Student "John" 33]

-- Define a function to get the name of a student
getName :: Student -> String
getName (Student name _) = name

-- Define a function to map a list of students to a list of names
getNames :: [Student] -> [String]
getNames = map getName

-- Apply the function to the list of students
studentNames :: [String]
studentNames = getNames students

--3.
-- Define a data type for students
data Student = Student String Int

-- Create a list of students from the given format
students :: [Student]
students = [Student "Ana" 25, Student "Jose" 37, Student "Maria" 23, Student "John" 33]

-- Define a function to get the age of a student
getAge :: Student -> Int
getAge (Student _ age) = age

-- Define a function to filter a list of students by age
filterByAge :: Int -> [Student] -> [Student]
filterByAge n = filter (\s -> getAge s < n)

-- Apply the function to the list of students with a given number
studentsUnder30 :: [Student]
studentsUnder30 = filterByAge 30 students

--4.
-- Define a data type for students
data Student = Student String Int

-- Create a list of students from the given format
students :: [Student]
students = [Student "Ana" 25, Student "Jose" 37, Student "Maria" 23, Student "John" 33]

-- Define a function to get the age of a student
getAge :: Student -> Int
getAge (Student _ age) = age

-- Define a function to filter a list of students by age range
filterByAgeRange :: Int -> Int -> [Student] -> [Student]
filterByAgeRange x y = filter (\s -> getAge s >= x && getAge s <= y)

-- Apply the function to the list of students with given x and y
studentsBetween20And30 :: [Student]
studentsBetween20And30 = filterByAgeRange 20 30 student