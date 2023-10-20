CREATE TABLE productType(
ID INT(7) NOT NULL AUTO_INCREMENT,
type VARCHAR(90) NOT NULL,
PRIMARY KEY(ID)
);

CREATE TABLE cityState(
city VARCHAR(90) NOT NULL,
state CHAR(2) NOT NULL,
zipCode CHAR(5) NOT NULL UNIQUE,
PRIMARY KEY(zipCode)
);

INSERT INTO productType(type)
SELECT DISTINCT productType FROM product;

INSERT INTO cityState(city,state,zipCode) 
SELECT DISTINCT city,state,zipCode FROM customer;

INSERT INTO cityState(city,state,zipCode)
SELECT DISTINCT city,state,zipCode FROM employee;

INSERT INTO cityState(city,state,zipCode)
SELECT DISTINCT city,state,zipCode FROM supplier;

UPDATE product 
SET productType = '1'
WHERE productType = ' meat';

UPDATE product 
SET productType = '2'
WHERE productType = ' seafood';

UPDATE product 
SET productType = '3'
WHERE productType = ' vegetable';

UPDATE product 
SET productType = '4'
WHERE productType = 'grain and rice';

UPDATE product 
SET productType = '5'
WHERE productType = 'bakery';

ALTER TABLE product
MODIFY COLUMN productType INT NOT NULL;

ALTER TABLE product 
ADD FOREIGN KEY (productType) REFERENCES productType(ID);

ALTER TABLE customer
ADD FOREIGN KEY (zipCode) REFERENCES cityState(zipCode);

ALTER TABLE customer
DROP COLUMN city,
DROP COLUMN state;

ALTER TABLE employee
ADD FOREIGN KEY (zipCode) REFERENCES cityState(zipCode);

ALTER TABLE employee
DROP COLUMN city,
DROP COLUMN state;

ALTER TABLE supplier
ADD FOREIGN KEY (zipCode) REFERENCES cityState(zipCode);

ALTER TABLE supplier
DROP COLUMN city,
DROP COLUMN state;


