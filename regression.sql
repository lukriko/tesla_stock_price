--  we will try to predict the stock price change with last month data

SELECT "Volume", 
rank() over( ORDER BY "Date" ASC) FROM stock_data st1
WHERE "Date"::date > '2024-12-01'::date
    ;

    -- with given data the logistic regression has probability of 0.8 with 80000000 volume

    -- python code
    -- import pandas as pd
-- from sklearn.linear_model import LogisticRegression

-- # Example data
-- data = pd.DataFrame({
--     'Volume': [77986500, 58267200, 50810900, 81403600, 81455800],
--     'PriceChange': [0, 1, 1, 1, 1]  # 1 = Increase, 0 = Decrease
-- })

-- # Prepare data
-- X = data[['Volume']]  # Ensure X is 2D
-- y = data['PriceChange']

-- # Create and fit the model
-- model = LogisticRegression()
-- model.fit(X, y)

-- # Predict probability of increase for a new volume
-- new_volume = [[80000000]]  # Example input for Volume
-- predicted_prob = model.predict_proba(new_volume)[:, 1]
-- print(f"Probability of Price Increase: {predicted_prob[0]:.2f}")
