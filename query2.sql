select p2.productline, avg(o2.shippeddate - o2.orderdate) as DiasDiferencia 
from productlines as p2, orders as o2, orderdetails o, products p 
where 
o2.ordernumber = o.ordernumber and 
o.productcode = p.productcode and
p.productline = p2.productline 
group by p2.productline 