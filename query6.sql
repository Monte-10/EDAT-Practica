SELECT  o1.productcode,
        o2.productcode,
        Count(*) AS n
FROM    orderdetails o1,
        orderdetails o2
WHERE   o1.ordernumber = o2.ordernumber
        AND o1.productcode < o2.productcode
GROUP   BY  o1.productcode,
            o2.productcode
HAVING Count(*) > 1
ORDER   BY n DESC;