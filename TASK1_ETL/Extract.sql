--create the database ecommerce_raw

CREATE DATABASE ecommerce_analysis;

USE ecommerce_analysis;

-- In ecommerce_raw SCHEMA
CREATE SCHEMA raw;

-- In ecommerce_cleaned schema
CREATE SCHEMA cleaned;

--customers
SELECT * INTO cleaned.customers FROM raw.customers;

-- orders
SELECT * INTO cleaned.orders FROM raw.orders;

-- order_items
SELECT * INTO cleaned.order_items FROM raw.order_items;

-- payments
SELECT * INTO cleaned.payments FROM raw.order_payments;

-- reviews
SELECT * INTO cleaned.reviews FROM raw.order_reviews;

-- products
SELECT * INTO cleaned.products FROM raw.products;

-- sellers
SELECT * INTO cleaned.sellers FROM raw.sellers;

-- geolocation
SELECT * INTO cleaned.geolocation FROM raw.geolocation;

-- category_translation
SELECT * INTO cleaned.category_translation FROM raw.product_category_name_translation;


-- load the order reviews dataset into the raw schema
DROP TABLE IF EXISTS dbo.olist_order_reviews_dataset;

CREATE TABLE raw.order_reviews (
    review_id VARCHAR(100),
    order_id VARCHAR(100),
    review_score INT,
    review_comment_title NVARCHAR(1000),
    review_comment_message NVARCHAR(MAX),
    review_creation_date DATETIME,
    review_answer_timestamp DATETIME
);

BULK INSERT raw.order_reviews
FROM 'C:\Users\ujay\Desktop\CodeAlpha_DataAnalysis\data\olist_order_reviews_dataset.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIELDQUOTE = '"',
    CODEPAGE = '65001',
    FORMAT = 'CSV',
    TABLOCK
);

select * from raw.order_reviews;