USE ShopDB;

INSERT INTO Products (Name, Description, Price, WarehouseAmount)
VALUES ('AwesomeProduct', 'Product Description', 5, 42);
SET @product_id = LAST_INSERT_ID();

INSERT INTO Customers (FirstName, LastName, Email, Address)
VALUES ('John', 'Doe', 'j@doe.ua', 'far, far away');
SET @customer_id = LAST_INSERT_ID();

INSERT INTO Orders (CustomerID, Date)
VALUES (@customer_id, '2023-01-01');
SET @order_id = LAST_INSERT_ID();

START TRANSACTION;

INSERT INTO OrderItems (OrderID, ProductID, Count)
VALUES (@order_id, @product_id, 1);

UPDATE Products
SET WarehouseAmount = WarehouseAmount - 1
WHERE ID = @product_id;

COMMIT;