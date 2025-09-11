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


  
