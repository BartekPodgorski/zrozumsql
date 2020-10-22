-- M6L18 - ORDER BY 
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
 	 		('Product 1', 'PRD2', 92.25, '1/11/2019'),
 	 		('Product 2', 'PRD2', 12.25, '1/11/2019'),
 	 		('Product 3', 'PRD3', 25.25, '2/11/2019'),
 	 		('Product 4', 'PRD4', 68.25, '3/11/2019')
;

-- 
SELECT p.product_name,
       p.product_code, 
       p.manufactured_date,
       p.product_quantity * 0.5 AS half_qty
  FROM products p 
 ORDER BY product_name ASC, product_code DESC;

--

SELECT p.product_name,
       p.product_code, 
       p.manufactured_date,
       p.product_quantity * 0.5 AS half_qty
  FROM products p 
 ORDER BY 1 ASC, 2 DESC;

--

SELECT p.product_name,
       p.product_code, 
       p.manufactured_date,
       p.product_quantity * 0.5 AS half_qty
  FROM products p 
 ORDER BY 1 ASC, 2;

--

SELECT p.product_name,
       p.product_code, 
       p.manufactured_date,
       p.product_quantity * 0.5 AS half_qty
  FROM products p 
 ORDER BY (p.product_quantity * 0.5) + 2;

-- FAIL

SELECT p.product_name AS pname,
       p.product_code, 
       p.manufactured_date,
       p.product_quantity * 0.5 AS half_qty
  FROM products p 
 ORDER BY half_qty + 2;

-- OK

SELECT p.product_name AS pname,
       p.product_code, 
       p.manufactured_date,
       p.product_quantity * 0.5 AS half_qty
  FROM products p 
 ORDER BY half_qty;
