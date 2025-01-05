--  overall the stock price change has appeared 130 times in 2010
-- after which there has been no such major difference between changes
--  averaging for 251.54 or 252 changes per year from 2011-2023
--  and having 2024 as a 1st-3rd semester), adding up for 237

SELECT
    TO_CHAR(TO_DATE("Date", 'MM/DD/YY'), 'YYYY') AS "year",
    count("Open")
 FROM stock_data
 GROUP BY "year"
 ORDER BY "year" ASC;


-- minimum appearances(outlier)
 SELECT
     TO_CHAR(TO_DATE("Date", 'MM/DD/YY'), 'YYYY') AS "year",
     count("Open")
FROM stock_data
GROUP BY "year"
ORDER BY count("Open") ASC
LIMIT 1;

-- average stock price change over 2011-2023
WITH cte_1 AS
    (
        SELECT
            TO_CHAR(TO_DATE("Date", 'MM/DD/YY'), 'YYYY') AS "year",
            count("Open") AS "count"
        FROM stock_data
        GROUP BY "year"
        ORDER BY "year" ASC
    )
    SELECT round(avg("count"),2) FROM cte_1
    WHERE "year" > '2010' and "year" < '2024';

