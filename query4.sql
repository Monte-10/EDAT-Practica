SELECT  o.officecode,
        Sum(o3.quantityordered) AS numberOfSoldItems
FROM    offices o
        NATURAL JOIN employees e
        JOIN customers c
        ON c.salesrepemployeenumber = e.employeenumber
        NATURAL JOIN orders o2
        NATURAL JOIN (SELECT o3.ordernumber,
                            Sum(o3.quantityordered) AS quantityordered
                    FROM    orderdetails o3
                    GROUP BY o3.ordernumber) AS o3
GROUP BY o.officecode
ORDER BY numberOfSoldItems DESC
LIMIT 1;