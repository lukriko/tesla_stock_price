
-- close stock price outlier detection for the year of 2023
-- average close stock price for 2023
SELECT avg("Close") FROM stock_data
WHERE "Date" LIKE '%23';

-- lower bound deviation(2)
SELECT avg("Close") - stddev("Close")*2 AS dl FROM stock_data
        WHERE "Date" LIKE '%23';

-- upper bound deviation(2)
  SELECT avg("Close") + stddev("Close")*2 AS dl FROM stock_data
        WHERE "Date" LIKE '%23';

-- standard deviation U - 2o <= "Close stock price" <= U + 2o
-- U - 2o = 133.6
-- U + 2o = 301.3

WITH dev_low AS
    (
        SELECT avg("Close") - stddev("Close")*2 AS dl FROM stock_data
        WHERE "Date" LIKE '%23'
    ),
dev_high AS
    (
        SELECT avg("Close") + stddev("Close")*2 AS dh FROM stock_data
        WHERE "Date" LIKE '%23'
    )

        SELECT * FROM stock_data
        JOIN dev_low
            ON 1=1
            JOIN dev_high
            ON 1=1
            WHERE "Close" >= dev_low.dl AND "Close" <= dev_high.dh
            AND "Date" LIKE '%23';

-- outliers after calculating average closed stock price +- 2 deviations

WITH dev_low AS
    (
        SELECT avg("Close") - stddev("Close")*2 AS dl FROM stock_data
        WHERE "Date" LIKE '%23'
    ),
dev_high AS
    (
        SELECT avg("Close") + stddev("Close")*2 AS dh FROM stock_data
        WHERE "Date" LIKE '%23'
    )

        SELECT * FROM stock_data
        JOIN dev_low
            ON 1=1
            JOIN dev_high
            ON 1=1
            WHERE( "Close" <= dev_low.dl OR "Close" >= dev_high.dh)
            AND "Date" LIKE '%23';


-- outliers after calculating average closed stock price +- 3 deviations
-- U - 3o = 91.7
-- U + 3o = 343.2
--  no outliers detected


WITH dev_low AS
    (
        SELECT avg("Close") - stddev("Close")*3 AS dl FROM stock_data
        WHERE "Date" LIKE '%23'
    ),
dev_high AS
    (
        SELECT avg("Close") + stddev("Close")*3 AS dh FROM stock_data
        WHERE "Date" LIKE '%23'
    )

        SELECT * FROM stock_data
        JOIN dev_low
            ON 1=1
            JOIN dev_high
            ON 1=1
            WHERE( "Close" <= dev_low.dl OR "Close" >= dev_high.dh)
            AND "Date" LIKE '%23';