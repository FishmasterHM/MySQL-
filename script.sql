# 草稿本
/*UPDATE customers
SET (cust_email, cust_name) = ('elmer@fudd.com', 'The Fudds')
WHERE cust_id = 10005;*/
/*
UPDATE customers
SET cust_email = 'elmer@fudd.com',
    cust_name = 'The Fudds'
WHERE cust_id = 10005;
*/
/*
CREATE VIEW productcustomers(name, contact, prod_id) AS
SELECT cust_name, cust_contact, prod_id
FROM customers, orders, orderitems
WHERE customers.cust_id = orders.cust_id
  AND orderitems.order_num = orders.order_num;
*/


#22.1
/*

-- Name: ordertotal
-- PARAMETERS: onumber = order number
--             taxable = 0 not taxable, 1
--             ototal = order total variable
DELIMITER //
CREATE PROCEDURE ordertotal(
  IN onumber INT,
  IN taxable BOOLEAN,
  OUT ototal DECIMAL(8,2)
) COMMENT 'Obtain order total, optionally adding tax'
BEGIN
  DECLARE total DECIMAL(8,2);    -- 可以利理解为局部变量?
  DECLARE taxrate INT DEFAULT 6; -- 常量6
 
  SELECT Sum(item_price*quantity)
  FROM orderitems
  WHERE order_num = onumber
  INTO total;
  
  IF taxable THEN
     SELECT total+(total*taxrate/100) into total;
  END IF;
  
  SELECT total INTO ototal;

END//

DELIMITER ;
*/

/*
CREATE TRIGGER showaddress 
AFTER INSERT ON vendors
FOR EACH ROW
BODY; 
*/

SET autocommit = 0;
SELECT * FROM text01;
START TRANSACTION;
DELETE FROM text01
WHERE number = 3;
SELECT * FROM text01;
DELETE FROM text01
WHERE numbr = 2;
SELECT * FROM text01;
#ROLLBACK;
SELECT * FROM text01;
