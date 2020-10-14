-- M5L4 - DELETE 
DROP TABLE IF EXISTS products;

CREATE TABLE products (
	id SERIAL,
	product_name VARCHAR(100),
	product_code VARCHAR(10),
	product_quantity NUMERIC(10,2),
	manufactured_date DATE,	
	added_by TEXT DEFAULT 'admin',
	created_date TIMESTAMP DEFAULT now()
);

INSERT INTO products (product_name, product_code, product_quantity, manufactured_date)					    
 	 VALUES ('Product 1', 'PRD1', 100.25, '20/11/2019'),
 	 		('Product 2', 'PRD2', 12.25, '1/11/2019'),
 	 		('Product 3', 'PRD3', 25.25, '2/11/2019'),
 	 		('Product 4', 'PRD4', 68.25, '3/11/2019')
; 					  

-- DELETE
DELETE FROM products;

SELECT * FROM products;

-- AUTOCOMMIT AND OTHER USER VIEW

-- DELETE WHERE
DELETE FROM products 
      WHERE product_code = 'PRD1' 
			AND 
			product_name = 'Product 0';

DELETE FROM products 
	  WHERE product_code = 'PRD1' 
	     OR product_name = 'Product 2';
	    
DELETE FROM products 
      WHERE product_code IN ('PRD1', 'PRD2');
     
DELETE FROM products 
      WHERE product_code NOT IN ('PRD1', 'PRD2');
