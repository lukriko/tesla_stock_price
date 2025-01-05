
WITH cte_1 AS (
    SELECT 
        TO_CHAR(TO_DATE("Date", 'MM/DD/YY'), 'YYYY') AS "year",
        AVG("Volume") AS "avgg"
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

-- maximum volume achieved per year

 SELECT 
        TO_CHAR(TO_DATE("Date", 'MM/DD/YY'), 'YYYY') AS "year",
        max("Volume") AS "max_volume"
    FROM stock_data
    GROUP BY TO_CHAR(TO_DATE("Date", 'MM/DD/YY'), 'YYYY')
    ORDER BY "year" ASC;