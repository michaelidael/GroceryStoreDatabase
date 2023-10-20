CREATE TABLE sizeType(
ID Int(7) NOT NULL AUTO_INCREMENT,
size VARCHAR(20) NOT NULL,
PRIMARY KEY(ID)
);



INSERT INTO sizeType(size)
SELECT DISTINCT SUBSTRING_INDEX(size, ' ', -1) 
FROM product;

ALTER TABLE product
ADD sizeTypeId INT(7) NOT NULL;

UPDATE product
SET sizeTypeId = 1
WHERE size LIKE '%ounce%';

UPDATE product
SET sizeTypeId = 2
WHERE size LIKE '%pound%';

UPDATE product
SET sizeTypeId = 3
WHERE size LIKE '%count%';

UPDATE product
SET sizeTypeId = 1
WHERE size LIKE '%oz%';

ALTER TABLE product
ADD FOREIGN KEY (sizeTypeId) REFERENCES sizeType(ID);

UPDATE product
SET size = SUBSTRING_INDEX(size, ' ',1);

ALTER TABLE product
MODIFY COLUMN size DECIMAL(7,2) NOT NULL;

INSERT INTO product (productName, productType, description, size, sizeTypeId, quantity, price)
VALUES
('steak', 1, "Butcher's Cut Filet Mignon", 10, 1, 30, 33.74),
('steak', 1, "Butcher's Cut Top Sirloin", 5, 1, 50, 14.99),
('steak', 1, 'T-Bone Steak', 18, 1, 40, 33.33),
('bison', 1, 'Ground Bison', 1, 2, 20, 22.49),
('turkey', 1, 'Home-Style Roasted Turkey Breast', 1.8, 2, 45, 21.99),
('turkey', 1, 'Turkey Burgers', 8, 3, 30, 21.99),
('ham', 1, 'Spiral Sliced Ham', 9, 2, 15, 89.99),
('pork', 1, 'Breaded Pork Tenderloin', 4, 3, 25, 19.99),
('salmon', 2, 'Lemon Dill Salmon Fillets', 6, 1, 20, 8.79),
('seabass', 2, 'Chilean Sea Bass', 5, 1, 30, 19.99),
('crab', 2, 'King Crab Legs', 2, 2, 16, 109.99),
('crab', 2, 'Gourmet Crab Cakes', 4, 3, 26, 34.99),
('lobster', 2, 'Cold Water Lobster Tails', 5, 1, 35, 22.99),
('bean', 3, 'Green Beans', 6.5, 1, 45, 10.99),
('broccoli', 3, 'Steakhouse Broccoli and Cauliflower Gratin', 22, 1, 35, 12.99),
('brussels sprouts', 3, 'Brussels Sprouts with Bacon & Shallots', 9.5, 1, 35, 14.99),
('corn', 3, 'Steakhouse Creamed Corn', 20, 1, 40, 10.99),
('mixed', 3, 'Roasted Vegetable Medley', 7, 1, 50, 9.99),
('asparagus', 3, 'Asparagus Spears With Hollandaise Sauce', 12, 1, 30, 15.99),
('potatoes', 3, 'Potatoes au Gratin', 8, 3, 55, 14.99),
('risotto', 4, 'Pepper Jack Risotto Cakes', 8, 3, 25, 19.99),
('rice', 4, 'Harvest Rice Pilaf', 25, 1, 45, 14.99),
('bread', 5, 'Mini Baguettes with Garlic Butter', 4, 3, 35, 49.99);


