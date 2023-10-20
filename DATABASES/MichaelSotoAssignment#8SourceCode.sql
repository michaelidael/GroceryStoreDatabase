use frozenfood;

ALTER TABLE customerOrder 
ADD total DECIMAL(7,2) NOT NULL DEFAULT 0.0;

UPDATE customerOrder AS c
INNER JOIN product as p
ON c.productId = p.id
SET c.total = c.quantity * p.price;

UPDATE customerOrder 
SET orderStateId = 
	(SELECT id
	FROM orderstate
	WHERE state = "Payment Received");

ALTER TABLE customerPayment
ADD paymentDate DATE NOT NULL DEFAULT (CURRENT_DATE);

INSERT INTO customerPayment(customerOrderId, total)
SELECT id, total
FROM customerOrder
WHERE orderStateId = 
	(SELECT id
	FROM orderState
	WHERE state= "Payment Received");

SELECT concat(c.firstName, " ", c.lastName), cp.customerOrderId AS "Customer Order", p.description AS Product, co.total AS "Product Total"
FROM customerPayment AS cp, customerOrder AS co, customer AS c, product AS p
WHERE cp.customerOrderId = co.id 
AND co.customerId = c.id
AND co.productId = p.id
ORDER BY c.lastName;

ALTER TABLE purchaseOrder
ADD total DECIMAL(7,2) NOT NULL DEFAULT 0.0;

UPDATE purchaseOrder 
SET total = quantity * 
	(SELECT price
	FROM product
	WHERE productId = ID);

INSERT INTO orderState
VALUES(13, 'Payment Sent');

SELECT supplierId, SUM(total)
FROM purchaseOrder 
GROUP BY supplierId;

UPDATE purchaseOrder
SET orderStateId = 
	(SELECT id
	FROM orderstate
	WHERE state = "Payment Sent")
WHERE supplierID IN (3,4,9);


ALTER TABLE supplierTransaction
ADD paymentDate DATE NOT NULL DEFAULT(CURRENT_DATE);

INSERT INTO supplierTransaction(purchaseOrderId,total)
SELECT id,total
FROM purchaseOrder
WHERE orderStateId = 
	(SELECT id
	FROM orderState
	WHERE state = "Payment Sent");


SELECT s.supplierName AS Supplier, st.purchaseOrderId AS "Purchase Order", p.description AS Product, po.total AS "Product Total"
FROM  supplierTransaction as st, purchaseOrder po, supplier s, product p
WHERE st.purchaseOrderId = po.id
AND po.supplierID = s.id
AND po.productId = p.id
ORDER BY s.supplierName;









