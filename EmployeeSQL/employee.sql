/*1. List the following details of each employee: employee number, last name, first name, sex, and salary.*/
select employees.emp_no, employees.last_name, employees.first_name, employees.sex,salaries.salary 
from employees, salaries 
Where salaries.emp_no = employees.emp_no;

/* 2.List first name, last name, and hire date for employees who were hired in 1986.*/
select employees.first_name, employees.last_name, employees.hire_date
from employees
where  extract(year from employees.hire_date) = 1986;

/*
3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
*/
select departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
from departments, dept_manager, employees
where departments.dept_no = dept_manager.dept_no and 
dept_manager.emp_no = employees.emp_no;
/*
4.List the department of each employee with the following information: employee number, last name, first name, and department name.
*/
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees, departments, dept_emp
where employees.emp_no = dept_emp.emp_no and
dept_emp.dept_no = departments.dept_no;

/*
5.List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
*/
select employees.first_name, employees.last_name, employees.sex
from employees
where employees.first_name = 'Hercules' and 
employees.last_name like 'B%';

/*
6.List all employees in the Sales department, including their employee number, last name, first name, and department name.
*/
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees, departments, dept_emp
where employees.emp_no = dept_emp.emp_no and
dept_emp.dept_no = departments.dept_no and
departments.dept_name = 'Sales';


/*
7.List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
*/
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees, departments, dept_emp
where employees.emp_no = dept_emp.emp_no and
dept_emp.dept_no = departments.dept_no and
departments.dept_name IN ('Sales','Development');


/*
8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
*/
Select employees.last_name, count(employees.last_name)
from employees
Group By employees.last_name
order by count(employees.last_name) desc
