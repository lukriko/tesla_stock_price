-- min and max stock prices

SELECT min("Open"), max("Open") from stock_data;

--  percent change from (new-old/old)

WITH cte_1 AS(
    SELECT "Open" FROM stock_data
    WHERE "Date" = (SELECT min("Date") from stock_data)
),
cte_2 AS(
    SELECT "Open" from stock_data
    WHERE "Date" = (SELECT max("Date") from stock_data)
    )
SELECT round((
    (c2."Open" - c1."Open")/c1."Open")
        ::NUMERIC,2) || '%'
            AS "percent_change_minDate_maxDate"
             FROM cte_1 AS c1
JOIN cte_2 AS c2
    on 1=1;

-- average closing stock price for each year group

SELECT round(avg("Close")::NUMERIC,2),
        DATE_PART('year', TO_DATE("Date", 'MM/DD/YY')) AS "year"
 FROM stock_data
 GROUP BY "year"
 ORDER BY "year" ASC;
