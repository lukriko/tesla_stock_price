-- SMA = 1/N*Sum()
SELECT * FROM stock_data 
WHERE "Date" LIKE '%24';

-- 397.6
-- 11/22/24 till 12/9/24 (10 appearance SMA)
-- identify simple moving average for the latest stock price appearance and its real value

-- This large difference suggests that the stock is experiencing a short-term spike,
--  which may not align with the smoothed trend.

-- SMA 351.45799 with actual 397.6 for latest date.
SELECT SUM("Open")/COUNT("Open") as SMA_11th FROM stock_data
WHERE "Date"::date >= '2024-11-22'::date AND
"Date"::date < '2024-12-09'::date;


-- Autocorrelation
-- to find the similar trend patterns i looked for data per year 2021-2022
-- identified the trend pattern from 2021-2022 february-march
-- autocoreel > 0 , similarly r > 0 (positive relationship)
-- having a pearson correlation coefficient of r = 0.969221377

SELECT "Close" 
FROM stock_data
WHERE "Date"::date >= '2022-02-01'::date AND "Date"::date <= '2022-03-01'::date
ORDER BY "Close" ASC;

SELECT "Close" 
FROM stock_data
WHERE "Date"::date >= '2021-02-01'::date AND "Date"::date <= '2021-03-01'::date
ORDER BY "Close" ASC;

-- python code
-- import numpy as np

-- arr_2021_max_10 = [225.1666718,227.406662,232.9466705,238.1666718,239.4766693,247.3399963,260.4333191,262.4599915,265.4066772,266.0499878]
-- arr_2022_max_10 = [254.6799927,266.9233398,269.956665,273.8433228,285.6600037,286.6666565,288.1233215,290.1433411,291.9200134,292.1166687]

-- mean_arr_2021 = np.mean(arr_2021_max_10)
-- mean_arr_2022 = np.mean(arr_2022_max_10)


-- coeff_auto = np.corrcoef(arr_2021_max_10,arr_2022_max_10)[0,1]
-- print(f"Autocorrelation (r): {coeff_auto}")


-- last two full months autocorrelation coeficient 2024 - october-november

SELECT "Close" 
FROM stock_data
WHERE "Date"::date >= '2024-10-01'::date AND "Date"::date <= '2024-11-01'::date
ORDER BY "Close" ASC
LIMIT 15;

SELECT "Close" 
FROM stock_data
WHERE "Date"::date >= '2024-11-01'::date AND "Date"::date <= '2024-12-01'::date
ORDER BY "Close" ASC
LIMIT 15;

-- python code
-- import numpy as np

-- arr_2024_oct_nov = [213.6499939,217.8000031,217.9700012,218.8500061,219.1600037,219.5700073,220.6999969,220.8899994,221.3300018,238.7700043,240.6600037,240.8300018,241.0500031,244.5,248.9799957]
-- arr_2024_nov_dec = [242.8399963,248.9799957,251.4400024,288.5299988,296.9100037,311.1799927,320.7200012,321.2200012,328.4899902,330.2399902,332.8900146,338.230011,338.5899963,338.7399902,339.6400146]

-- mean_arr_2024_oct_nov = np.mean(arr_2024_oct_nov)
-- mean_arr_2024_nov_dec = np.mean(arr_2024_nov_dec)


-- coeff_auto = np.corrcoef(arr_2024_oct_nov,arr_2024_nov_dec)[0,1]
-- print(f"Autocorrelation (r): {coeff_auto}")
-- r = 0.755109415, r > 0