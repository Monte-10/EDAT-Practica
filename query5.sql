SELECT  o2.country,
        Count(*) AS numberOfOffice
FROM    offices o2
WHERE   o2.officecode NOT IN    (SELECT e.officecode
                                FROM    employees e
                                WHERE e.employeenumber IN
                                    (SELECT  c.salesrepemployeenumber
                                    FROM    customers c
                                    WHERE   c.customernumber IN
                                        (SELECT o.customernumber
                                        FROM orders o
                                        WHERE
                                        Extract(year FROM o.orderdate) = '2003')))
GROUP   BY o2.country
ORDER   BY numberOfOffice DESC;