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




SELECT
       c.full_name,
       COUNT(o.order_id) AS total_orders,
       SUM(CASE
              WHEN o.status IN ('failed', 'refunded')
              THEN 1
              ELSE 0
              END) AS total_failed_or_refunded_orders,
       ROUND((COUNT(o.order_id)-SUM(CASE WHEN o.status IN ('failed', 'refunded') THEN 1 ELSE 0 END)) * 1.0 / COUNT(o.order_id) * 100, 1) AS success_rate
FROM
       customers c
INNER JOIN
       orders o ON c.customer_id = o.customer_id
GROUP BY
       c.full_name
ORDER BY 
       success_rate DESC;



SELECT
    city,
    EXTRACT(MONTH FROM date) AS month,
    AVG(temperature) AS avg_temp,
    CASE
        WHEN AVG(temperature) > 20 THEN 'Warm'
        ELSE 'Cold'
    END AS temp_category
FROM
    weather_data
GROUP BY
    city,
    EXTRACT(MONTH FROM date)
ORDER BY
    city, month;




SELECT
    b.title,
    COUNT(r.review_id) AS review_count,
    AVG(r.rating) AS avg_rating,
    CASE
        WHEN COUNT(r.review_id) > 50 THEN 'Popular'
        ELSE 'Less Known'
    END AS popularity
FROM
    books b
LEFT JOIN
    reviews r ON b.book_id = r.book_id
GROUP BY
    b.title
ORDER BY
    review_count DESC;



SELECT
    r.region_name,
    SUM(s.sale_amount) AS total_sales,
    CASE
        WHEN SUM(s.sale_amount) > 10000 THEN 'High Revenue'
        ELSE 'Low Revenue'
    END AS revenue_category
FROM
    regions r
INNER JOIN
    sales s ON r.region_id = s.region_id
GROUP BY
    r.region_name
HAVING
    SUM(s.sale_amount) > 0
ORDER BY
    total_sales DESC;



Відновлення. освіжити джоіни.

SELECT
    e.emp_name,
    d.dept_name
FROM
    employees e
INNER JOIN
    departments d ON e.dept_id = d.dept_id
ORDER BY
    e.emp_name ASC;




SELECT
    s.student_name,
    c.class_name
FROM
    students s
INNER JOIN
    classes c ON s.class_id = c.class_id
ORDER BY
    s.student_name ASC;




SELECT
    s.student_name,
    c.class_name
FROM
    students s
LEFT JOIN
    classes c ON s.class_id = c.class_id
ORDER BY
    s.student_name ASC;





SELECT
    s.student_id,
    s.student_name,
    c.class_name,
    AVG(g.grade) as average_grade,
    CASE
        WHEN AVG(g.grade) > 90 THEN 'Excellent'
        WHEN AVG(g.grade) > 80 THEN 'Good'
        ELSE 'Needs improvement'
    END AS performance
FROM
    students s
LEFT JOIN
    grades g ON s.student_id = g.student_id
LEFT JOIN
    classes c ON s.class_id = c.class_id
GROUP BY
    s.student_id,
    s.student_name,
    c.class_name
HAVING
    AVG(g.grade) > 70
ORDER BY
    average_grade DESC;




CREATE VIEW v_manager_avg_salary AS
SELECT 
    ROUND(AVG(s.salary), 2) AS avg_salary
FROM salaries s
JOIN employees e ON e.emp_no = s.emp_no
WHERE e.emp_no IN (10002, 10005, 10007)
  AND s.from_date BETWEEN '1991-01-01' AND '1996-12-31';


  

