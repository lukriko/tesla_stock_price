-- average percent change of close stock price per year
-- დახურული საფონდო ფასის საშულო პროცენტული ცვლილება წლიურად.

WITH cte_1 AS (
    SELECT 
        TO_CHAR(TO_DATE("Date", 'MM/DD/YY'), 'YYYY') AS "year",
        AVG("Close") AS "avgg"
    FROM stock_data
    GROUP BY TO_CHAR(TO_DATE("Date", 'MM/DD/YY'), 'YYYY')
    ORDER BY "year" ASC
)
SELECT 
    c1."year" AS "current_year",
    c2."year" AS "previous_year",
    c1.avgg AS "current_avg",
    c2.avgg AS "previous_avg",
   round(((c1.avgg - c2.avgg) / c2.avgg)::NUMERIC * 100, 2) || '%' AS "percent_change"
FROM cte_1 AS c1
JOIN cte_1 AS c2
    ON c1."year"::INTEGER = c2."year"::INTEGER + 1
ORDER BY c1."year";

-- --------------
-- From below given analysis tesla had its most avg_percent_change from 2019-2020
-- as well as from 2012-2013 and 2020-2021

--the launch of UNVEILING OF MODEL Y AND THE CYBERTRUCK(2019-2021),change(430.1%)
--  TESLA REVEALS THE FIRST SUV – MODEL X(2012-2013), change(234.9%)

WITH cte_1 AS (
    SELECT 
        TO_CHAR(TO_DATE("Date", 'MM/DD/YY'), 'YYYY') AS "year",
        AVG("Close") AS "avgg"
    FROM stock_data
    GROUP BY TO_CHAR(TO_DATE("Date", 'MM/DD/YY'), 'YYYY')
    ORDER BY "year" ASC
)
SELECT 
    c1."year" AS "current_year",
    c2."year" AS "previous_year",
    c1.avgg AS "current_avg",
    c2.avgg AS "previous_avg",
   round(((c1.avgg - c2.avgg) / c2.avgg)::NUMERIC * 100, 2) || '%' 
   AS "percent_change",
   dense_rank() over(ORDER BY round(((c1.avgg - c2.avgg) / c2.avgg)::NUMERIC * 100, 2) DESC) as "Rank"
FROM cte_1 AS c1
JOIN cte_1 AS c2
    ON c1."year"::INTEGER = c2."year"::INTEGER + 1
ORDER BY "Rank" ASC;