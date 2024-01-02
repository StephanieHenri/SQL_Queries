  SELECT 
		sales_id,
		store_id,
		product_id,
		date,
		unit_price,
		quantity
 FROM stella_schmucker.sales 
 order by product_id

-- Returns first 100 rows from aggmm.sales
  SELECT 
		sales_id,
		store_id,
		product_id,
		date,
		unit_price,
		quantity
 FROM aggmm.sales 
 order by product_id
 -- inner join only returns rows that have matching values in both tables
select *
FROM stella_schmucker.sales s
inner join aggmm.sales e 
on e.product_id = s.product_id
LIMIT 100;
-- full outer join to return all rows from both tables - if there's no matching row in the second table, NULLS are returned
-- to remove nulls -- isnull(e.quantity,0), etc.,
  select e.product_id, s.product_id, e.quantity as AggmmStore, s.quantity as StellaStore
FROM stella_schmucker.sales s 
full outer join aggmm.sales e 
on e.product_id = s.product_id
LIMIT 1000;
-- To merge product ID into a single column, add coalesce
select COALESCE(e.product_id, s.product_id) as Product_ID, e.quantity as AggmmStore, s.quantity as StellaStore
 FROM stella_schmucker.sales s
 full outer join aggmm.sales e 
 on e.product_id = s.product_id
LIMIT 1000;