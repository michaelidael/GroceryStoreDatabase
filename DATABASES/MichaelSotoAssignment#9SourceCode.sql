use frozenfood;

CREATE VIEW productSupplierDetail AS
SELECT p.description AS Product, s.supplierName AS Supplier
FROM product p, supplier s, productSupplier ps
WHERE ps.productId = p.id
AND ps.supplierId = s.id
ORDER BY s.supplierName;

CREATE VIEW customerOrderDetail AS
SELECT concat(c.firstName, " ", c.lastName) AS Customer, p.description AS Product, co.quantity AS Quantity, co.orderDate AS "Date Ordered", os.state AS OrderStatus
FROM product p, customer c, customerOrder co, orderState os
WHERE co.productId = p.id
AND co.customerId = c.id
AND co.orderStateID = os.id;

CREATE VIEW purchaseOrderDetail AS
SELECT s.supplierName AS Supplier, p.description AS Product, po.quantity AS Quantity, po.orderDate AS "Date Ordered", os.state AS OrderStatus
FROM product p, supplier s, purchaseOrder po, orderState os
WHERE po.productId= p.id
AND po.supplierId = s.id
AND po.orderStateID = os.id;

CREATE VIEW customerPaymentDetail AS
SELECT concat(c.firstName, " ", c.lastName) AS Customer, cp.customerOrderId AS "Customer Order", p.description AS Product, co.total AS "Product Total"
FROM customerPayment cp, customerOrder co, customer c, product p
WHERE cp.customerOrderId = co.id
AND co.productId = p.id
AND co.customerId = c.id
ORDER BY c.lastName;

CREATE VIEW supplierTransactionDetail AS
SELECT s.supplierName AS Supplier, st.purchaseOrderId AS "Purchase Order", p.description AS Product, po.total AS "Product Total"
FROM supplierTransaction st, purchaseOrder po, supplier s, product p 
WHERE st.purchaseOrderId = po.id
AND po.productId = p.id
AND po.supplierId = s.id
ORDER BY s.supplierName;

CREATE VIEW productDetail AS
SELECT p.id AS "Product ID", p.productName AS "Product Name", pt.type AS "Category", p.description AS Description, concat(p.size," ", st.size) AS Size, p.quantity AS "In Stock", concat("$", p.price) AS Cost					 
FROM product p, productType pt, sizeType st
WHERE p.productType = pt.id
AND p.sizeTypeId = st.id
ORDER BY p.productName;

CREATE VIEW employeeSupplierDetail AS
SELECT  concat(e.firstName, " ", e.lastName) AS Representative, s.supplierName AS Supplier
FROM employee e, supplier s, employeeSupplier es
WHERE es.employeeId = e.id
AND es.supplierId = s.id
ORDER by e.lastName;

