SELECT DISTINCT ON (emp_no) emp_no,
       first_name,
       last_name,
       title, 
       to_date
INTO most_recent_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

SELECT DISTINCT ON (emp_no) emp_no,
       first_name,
       last_name,
       title,
       to_date
INTO unique_titles
FROM most_recent_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no ASC, to_date DESC;

SELECT DISTINCT ON (e.emp_no) e.emp_no,
       e.first_name,
       e.last_name,
       e.birth_date,
       de.from_date,
       de.to_date,
       t.title
INTO mentorship_eligibility
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN titles t ON e.emp_no = t.emp_no
WHERE de.to_date = '9999-01-01'
  AND e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY e.emp_no, de.to_date DESC;

