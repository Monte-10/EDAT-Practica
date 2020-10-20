select c.customernumber, c.customername, 
sum (p2.buyprice) as total
from customers as c, orders o, orderdetails o2, 
products p2 
where o.customernumber = c.customernumber
	and o2.ordernumber = o.ordernumber 
	and o2.productcode = p2.productcode
	and c.customernumber in (
		select distinct c.customernumber 
from customers as c, orders o, orderdetails o2, 
products p2 
where o.customernumber = c.customernumber
	and o2.ordernumber = o.ordernumber 
	and o2.productcode = p2.productcode
	and p2.productname = '1940 Ford Pickup Truck'
	)
	group by c.customernumber, c.customername
	order by total desc