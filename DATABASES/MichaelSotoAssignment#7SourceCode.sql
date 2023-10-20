use frozenfood;

INSERT INTO productSupplier (productId, supplierId)
VALUES
(44,7),
(45,7),
(51,10),
(52,10),
(53,10),
(46,8),
(47,8),
(38,4),
(39,4),
(42,6),
(43,6),
(36,3),
(37,3),
(40,5),
(41,5),
(48,9),
(49,9),
(50,9),
(34,2),
(35,2),
(31,1),
(32,1),
(33,1);

INSERT INTO customerOrder(customerId,productId,quantity,orderDate,orderStateID)
VALUES
(22,23,2,DATE(NOW()),1),
(22,24,4,DATE(NOW()),1),
(33,14,6,DATE(NOW()),1),
(33,20,4,DATE(NOW()),1),
(11,34,4,DATE(NOW()),1),
(11,44,10,DATE(NOW()),1),
(35,1,4,DATE(NOW()),1),
(15,10,6,DATE(NOW()),1),
(25,50,3,DATE(NOW()),1),
(12,9,8,DATE(NOW()),1);

INSERT INTO purchaseOrder(supplierId,productId,quantity,orderDate,orderStateID)
VALUES
(1,1,10,DATE(NOW()),1),
(1,2,15,DATE(NOW()),1),
(3,8,15,DATE(NOW()),1),
(7,21,12,DATE(NOW()),1),
(9,26,20,DATE(NOW()),1),
(9,27,18,DATE(NOW()),1),
(2,34,10,DATE(NOW()),1),
(3,37,15,DATE(NOW()),1),
(4,41,14,DATE(NOW()),1),
(5,39,10,DATE(NOW()),1);


SELECT description AS Product, supplierName AS Supplier
FROM product p, supplier s, productSupplier ps
WHERE ps.productId = p.ID
AND ps.supplierId = s.ID
ORDER BY Supplier;

 





0

