-- create table owners
CREATE TABLE owners (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  location TEXT NOT NULL
);

-- create table pets
CREATE TABLE pets (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  age INTEGER NOT NULL,
  "ownerId" INTEGER REFERENCES owners(id)
);

-- seeding owners table
INSERT INTO owners (name, location)
VALUES 
  ('alice', 'Washington'),
  ('bob', 'Maine')
RETURNING *;

-- seeding pets table
INSERT INTO pets (name, age, "ownerId") 
VALUES 
  ('wally', 3, 2), 
  ('darla', 2, 1), 
  ('albert', 4, 2), 
  ('felix', 3, 1) 
RETURNING *;

-- create tricks table
CREATE TABLE tricks (
  id SERIAL PRIMARY KEY,
  title VARCHAR(50)
);

-- seeding tricks table
INSERT INTO tricks (title)
VALUES
  ('sit'),
  ('stay'),
  ('shake')
RETURNING *;

-- create pet_trick through table
CREATE TABLE pet_trick (
  id SERIAL PRIMARY KEY,
  "petId" INTEGER REFERENCES pets(id),
  "trickId" INTEGER REFERENCES tricks(id),
  UNIQUE("petId", "trickId")
);

-- seed pet_trick through table
INSERT INTO pet_trick ("petId", "trickId")
VALUES
 (1, 1),
 (1, 2),
 (3, 3)
RETURNING *;
