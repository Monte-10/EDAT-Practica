select e4.employeenumber, e4.lastname, e4.reportsto from employees e4 
where e4.reportsto in
(select e2.employeenumber from employees e2 
where e2.reportsto in (select e3.employeenumber from employees e3 where e3.reportsto is null))