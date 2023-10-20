CREATE TABLE product(
ID INT(7) NOT NULL AUTO_INCREMENT,
productName VARCHAR(90) NOT NULL,
productType VARCHAR(90) NOT NULL,
description VARCHAR(90) NOT NULL,
size VARCHAR(50) NOT NULL,
quantity INT(7) NOT NULL,
price decimal(7,2) NOT NULL,
PRIMARY KEY(ID)
);

CREATE TABLE employeeSupplier(
employeeId INT(7) NOT NULL,
supplierId INT(7) NOT NULL,
PRIMARY KEY(employeeID,supplierId),
FOREIGN KEY(employeeId) REFERENCES employee(ID),
FOREIGN KEY(supplierId) REFERENCES supplier(ID)
);

CREATE TABLE productSupplier(
productId INT(7) NOT NULL,
supplierId INT(7) NOT NULL,
PRIMARY KEY(productId,supplierId),
FOREIGN KEY(productId) REFERENCES product(ID),
FOREIGN KEY(supplierId) REFERENCES supplier(ID)
);

INSERT INTO product
(productName,productType,description,size,quantity,price)
VALUES
('lamb shank','meat','lamb shank in rosemary and mint sauce','10 ounce','20','9.99'),
('veal',' meat',' veal osso buco',' 15.5 ounce',' 15',' 11.99'),
('short rib',' meat',' braveheart angus beef boneless short rib',' 12 ounce',' 40',' 7.99'),
('flank steak',' meat',' braveheart angus beef flank steak',' 2 pound',' 30',' 16.99'),
('chicken',' meat',' boneless chicken breasts',' 8 count',' 56',' 21.99'),
('pork chops',' meat',' bacon-wrapped pork chops',' 4 count',' 42',' 19.99 '),

('langoustines',' seafood',' medium wild langoustines',' 7 count',' 25',' 20.99'),
('octopus',' seafood',' cooked small octopus tentacles',' 3 count',' 15',' 23.00'),
('shrimp',' seafood',' red shrimp from argentina XL',' 12 count',' 50',' 12.99'),
('clams',' seafood',' coquina clams',' 12 count',' 45',' 9.99'),

('peas',' vegetable',' extra fine french peas',' 2 pound',' 60',' 5.99'),
('artichoke',' vegetable',' artichoke bottoms',' 2 pound',' 24',' 17.69'),
('bean',' vegetable',' very find yellow wax beans',' 2 pound',' 30',' 6.29'),
('broccoli',' vegetable',' broccoli florets',' 2 pound',' 55',' 4.49'),
('potatoes',' vegetable',' family size smashed red potatoes',' 32 ounce',' 55',' 12.99'),
('potatoes',' vegetable',' family size whipped sweet potatoes',' 32 ounce',' 55',' 14.49'),
('potatoes',' vegetable',' potatoes au gratin',' 3 ounce',' 55',' 8.49'),

('rice',' grain and rice',' jasmine rice',' 2 pound',' 45',' 9.99'),
('rice',' grain and rice',' brown',' red and wild rice medley',' 2 pound',' 35',' 9.99'),
('quinoa',' grain and rice',' organic quinoa',' 2 pound',' 26',' 12.99'),
('lentils',' grain and rice',' black beluga lentils',' 2 pound 18',' 9.99'),

('pastry',' bakery',' frangipane king cake',' 19 ounce',' 32',' 19.99'),
('pastry',' bakery',' chocolate croissant',' 3 ounce',' 90',' 1.90'),
('dessert',' bakery',' tiramisu classico',' 3 oz',' 60',' 4.99'),
('dessert',' bakery',' authentic french creme brulee',' 5 ounce',' 54',' 5.99'),
('pie',' bakery',' cappuccino pie',' 3 pound',' 10',' 36.50'),
('cake',' bakery',' red berry cheesecake',' 3 pound',' 12',' 36.50'),
('bread',' bakery',' brioche burger buns',' 4 count',' 44',' 4.80'),
('bread',' bakery',' ciabatta sandwich 6 inch',' 3 count',' 28',' 3.29'),
('dough',' bakery',' mini blinis',' 16 count',' 26',' 4.46');

INSERT INTO employeeSupplier
(employeeId,supplierId)
VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10);


INSERT INTO productSupplier
(productId,supplierId)
VALUES
(1,1),
(2,1),
(3,1),
(4,2),
(5,2),
(6,2),
(7,3),
(8,3),
(9,3),
(10,4),
(11,4),
(12,4),
(13,5),
(14,5),
(15,5),
(16,6),
(17,6),
(18,6),
(19,7),
(20,7),
(21,7),
(22,8),
(23,8),
(24,8),
(25,9),
(26,9),
(27,9),
(28,10),
(29,10),
(30,10);





