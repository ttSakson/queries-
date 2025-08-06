SELECT ct.category_name, 
       COUNT(DISTINCT o.customer_id) AS unique_customers, 
       SUM(o.total_amount) AS total_sales
FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id
JOIN products p ON o.order_id = p.order_id
JOIN categories ct ON p.category_id = ct.category_id
WHERE c.country = 'Australia'
AND ct.category_name LIKE '%Furniture%'
GROUP BY ct.category_name
ORDER BY total_sales DESC;



SELECT ct.category_name,
       count(DISTINCT order_id) as order_amount
FROM orders o
       JOIN customers c ON c.customer_id = o.customer_id
       JOIN products p ON o.order_id = p.order_id
       JOIN categories ct ON ct.category_id = p.category_id
WHERE c.country = 'Canada' 
       AND ct.category_name LIKE '%Books%'
GROUP BY ct.category_name
ORDER BY ct.category_name ASC;



SELECT ct.category_name,
       COUNT(DISTINCT o.order_id) as order_count,
       SUM(o.total_amount) as total_sales,
       CASE 
              WHEN SUM(o.total_amount) > 10000 THEN 'High'
              ELSE 'Low'
       END AS sales_category
FROM orders o
       JOIN customers c ON c.customer_id = o.customer_id
       JOIN products p ON o.order_id = p.order_id
       JOIN categories ct ON ct.category_id = p.category_id
WHERE c.country = 'France'
       AND ct.category_name LIKE '%Electronics%'
GROUP BY ct.category_name
ORDER BY SUM(o.total_amount) DESC;



SELECT o.order_id,
       o.total_amount,
       ct.category_name
FROM orders o
       JOIN customers c ON o.customer_id = c.customer_id
       JOIN products p ON o.order_id = p.order_id
       JOIN categories ct ON ct.category_id = p.category_id
WHERE c.country = 'France'
       AND ct.category_name LIKE '%Electronics%'
ORDER BY o.total_amount DESC;



"Звіт по працівниках із зарплатою > 50000".
SELECT e.name AS employee_name,
       e.salary,
       d.dept_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE salary > 50000
ORDER BY salary ASC;


"Звіт по замовленнях із Paris 2025".
SELECT c.name AS customer_name,
       o.order_date,
       p.product_name,
       o.amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN products p ON o.order_id = p.order_id
WHERE c.city = 'Paris' AND YEAR(o.order_date) = 2025
ORDER BY o.order_date ASC;



SELECT st.store_name,
       sl.sale_date,
       sl.total_sale,
       i.item_name
FROM stores st
JOIN sales sl ON st.store_id = sl.store_id
JOIN inventory i ON st.store_id = i.store_id
WHERE st.location = 'London' 
  AND sl.sale_date BETWEEN '2025-02-01' AND '2025-02-28'
ORDER BY st.store_name ASC;



SELECT spp.company_name, 
       wh.warehouse_name, 
       sh.shipment_date, 
       sh.cost,
       CASE
           WHEN sh.cost > 5000 THEN 'Expensive'
           ELSE 'Cheap'
       END AS cost_category
FROM suppliers spp
JOIN shipments sh ON spp.supplier_id = sh.supplier_id
JOIN warehouses wh ON wh.warehouse_id = sh.warehouse_id
WHERE spp.region = 'North' 
       AND sh.shipment_date BETWEEN '2025-03-01' AND '2025-03-31'
ORDER BY sh.shipment_date ASC;



SELECT p.project_name,
       d.dept_name,
       SUM(t.hours_spent) AS total_hours,
       CASE
           WHEN SUM(t.hours_spent) > 100 THEN 'High'
           ELSE 'Low'
       END AS hours_category
FROM projects p
JOIN tasks t ON p.project_id = t.project_id
JOIN employees e ON t.employee_id = e.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE p.start_date BETWEEN '2025-05-01' AND '2025-05-31'
GROUP BY p.project_name, d.dept_name
ORDER BY SUM(t.hours_spent) DESC;



SELECT *
FROM employees
WHERE salary > 50000;

