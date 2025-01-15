CREATE TABLE IF NOT EXISTS accounts(
  id VARCHAR(255) NOT NULL primary key COMMENT 'primary key',
  createdAt DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Time Created',
  updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Update',
  name varchar(255) COMMENT 'User Name',
  email varchar(255) UNIQUE COMMENT 'User Email',
  picture varchar(255) COMMENT 'User Picture'
) default charset utf8mb4 COMMENT '';

INSERT INTO 
accounts(id, name, email, picture)
VALUES("673fb2660bd9242d71b7587b", "Tristan Martinez", "skysnkrs@gmail.com", "https://lh3.googleusercontent.com/a/ACg8ocJizF8499ujn9mxVrAtVmjxJWGuhSX1VHMs6oEOq_BjHpY6_dU=s96-c");
SELECT * FROM accounts;

CREATE TABLE cars(
  -- make sure the first column in your table is the id
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
  updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  make TINYTEXT NOT NULL,
  model TINYTEXT NOT NULL,
  year SMALLINT UNSIGNED NOT NULL,
  price INT UNSIGNED NOT NULL,
  color TINYTEXT,
  img_url TEXT NOT NULL,
  description TEXT,
  engine_type ENUM('v6', 'v8', 'v10', '4-cylinder', 'unknown') NOT NULL,
  mileage MEDIUMINT UNSIGNED NOT NULL,
  has_clean_title BOOLEAN NOT NULL,
  creator_id VARCHAR(255) NOT NULL,
  -- there must be a match between an account id and the creator_id of a car to create a car
  -- if someone deletes their account, go delete all of the cars that account created
  FOREIGN KEY(creator_id) REFERENCES accounts(id) ON DELETE CASCADE
);

DROP TABLE cars;

SELECT * FROM accounts;

INSERT INTO 
cars(make, model, year, price, color, img_url, description, engine_type, mileage, has_clean_title, creator_id)
VALUES("john", "deere", 2004, 120000, "green", "https://images.unsplash.com/photo-1531798123643-26d5ab4c264d?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fHRyYWN0b3J8ZW58MHx8MHx8fDA%3D", "'car' for mick", "v10", 100000, true, "65f87bc1e02f1ee243874743");

SELECT * FROM cars;

SELECT 
cars.*,
accounts.*
FROM cars 
JOIN accounts ON cars.creator_id = accounts.id;

SELECT 
cars.*,
accounts.*
FROM cars
JOIN accounts ON cars.creator_id = accounts.id
WHERE cars.id = 2;


UPDATE cars
SET
make = "MAZDA",
model = "MIATA" 
WHERE id = 2;


CREATE TABLE houses(
 id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
 sqft INT NOT NULL,
 bedrooms INT NOT NULL,
 bathrooms DOUBLE NOT NULL,
 imgUrl VARCHAR(255) NULL,
 description VARCHAR(255) NOT NULL,
 price INT NOT NULL,
createdAt DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Time Created',
updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Update',
  creator_id VARCHAR(255) NOT NULL,
  FOREIGN KEY(creator_id) REFERENCES accounts(id) ON DELETE CASCADE
);

DROP TABLE houses;

INSERT INTO 
houses(sqft, bedrooms, bathrooms, imgUrl, description, price, creator_id)
VALUES(2500, 3, 2, "https://plus.unsplash.com/premium_photo-1689609950112-d66095626efb?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", "This is a very nice home with a cool bathroom", 250000, "673fb2660bd9242d71b7587b");


SELECT * FROM houses;

SELECT 
houses.*,
accounts.*
FROM houses 
JOIN accounts ON houses.creator_id = accounts.id;