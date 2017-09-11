SELECT cust_name, cust_contact
FROM customers
WHERE cust_id IN (SELECT DISTINCT cust_id 
      	      	  FROM orders 
		  WHERE order_num IN (SELECT DISTINCT order_num 
      		    		      FROM orderitems 
		    		      WHERE item_price >= 10));
