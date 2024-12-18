CREATE TABLE IF NOT EXISTS
  sales_data_dev.sales_details ( id integer NOT NULL OPTIONS (description = ' product_id '),
    product_name string,
    price float64 OPTIONS (description = ' product_price '),
    sale_date date );
