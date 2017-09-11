# 草稿本
/*UPDATE customers
SET (cust_email, cust_name) = ('elmer@fudd.com', 'The Fudds')
WHERE cust_id = 10005;*/

UPDATE customers
SET cust_email = 'elmer@fudd.com',
    cust_name = 'The Fudds'
WHERE cust_id = 10005;
