CREATE TABLE orderState(
ID INT(7) NOT NULL AUTO_INCREMENT,
state varchar(20) NOT NULL,
PRIMARY KEY(ID)
);

INSERT INTO orderState(state)
Values('New order');

INSERT INTO orderState(state)
Values('Buyer contacted');

INSERT INTO orderState(state)
Values('Seller contacted');

INSERT INTO orderState(state)
Values('Invoice sent');

INSERT INTO orderState(state)
Values('Invoice received');

INSERT INTO orderState(state)
Values('Payment pending');

INSERT INTO orderState(state)
Values('Payment received');

INSERT INTO orderState(state)
Values('Shipped');

INSERT INTO orderState(state)
Values('Awaiting pickup');

INSERT INTO orderState(state)
Values('Cancelled');

INSERT INTO orderState(state)
Values('Backordered');

INSERT INTO orderState(state)
Values('Completed');

CREATE TABLE customerOrder(
ID INT(7) NOT NULL AUTO_INCREMENT,
customerId INT(7) NOT NULL,
productId INT(7) NOT NULL,
quantity INT(7) NOT NULL,
orderDate DATE NOT NULL,
orderStateId INT(7) NOT NULL,
CHECK (quantity>0),
PRIMARY KEY(ID),
FOREIGN KEY(customerId) REFERENCES customer(Id),
FOREIGN KEY(productId) REFERENCES product(Id),
FOREIGN KEY(orderStateId) REFERENCES orderState(ID)
);

CREATE TABLE purchaseOrder(
ID INT(7) NOT NULL AUTO_INCREMENT,
supplierId INT(7) NOT NULL,
productId INT(7) NOT NULL,
quantity INT(7) NOT NULL,
orderDate DATE NOT NULL,
orderStateId INT(7) NOT NULL,
CHECK (quantity>0),
PRIMARY KEY(ID),
FOREIGN KEY(supplierId) REFERENCES supplier(id),
FOREIGN KEY(productId) REFERENCES product(id),
FOREIGN KEY(orderStateId) REFERENCES orderState(ID)
);

CREATE TABLE customerPayment(
ID INT(7) NOT NULL AUTO_INCREMENT,
customerOrderId INT(7) NOT NULL,
total DECIMAL(10,2) NOT NULL,
CHECK(total>0),
PRIMARY KEY(ID),
FOREIGN KEY(customerOrderId) REFERENCES customerOrder(id)
);


CREATE TABLE supplierTransaction(
ID INT(7) NOT NULL AUTO_INCREMENT,
purchaseOrderId INT(7) NOT NULL,
total DECIMAL(10,2) NOT NULL,
CHECK (total>0),
PRIMARY KEY(ID),
FOREIGN KEY(purchaseOrderId) REFERENCES purchaseOrder(id)
);



