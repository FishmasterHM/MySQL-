/*SELECT cust_name, cust_contact
FROM customers
WHERE cust_id IN (SELECT DISTINCT cust_id 
      	      	  FROM orders 
		  WHERE order_num IN (SELECT DISTINCT order_num 
      		    		      FROM orderitems 
		    		      WHERE item_price >= 10));*/

/*SELECT cust_name, cust_state, (SELECT COUNT(*)
                               FROM orders
                               WHERE  orders.cust_id = customers.cust_id) AS orders
FROM customers;*/
                                
/*SELECT prod_id
FROM orderitems
WHERE orderitems.order_num = orders.order_num;*/

#查询顾客名字,购买价格大于10的物品的总量
SELECT cust_name, cust_city, All_sum
FROM customers, (SELECT orders.cust_id, SUM(a_sum) AS All_sum
                 FROM (SELECT order_num, SUM(quantity) AS a_sum
                       FROM orderitems
                       WHERE item_price >= 10
                       GROUP BY order_num) AS t1, orders
                 WHERE t1.order_num = orders.order_num
                 GROUP BY orders.cust_id) AS t2
WHERE t2.cust_id = customers.cust_id;
