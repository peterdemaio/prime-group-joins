-- Get all customers and their addresses.

SELECT * FROM "customers"
JOIN "addresses" on "customers".id = "addresses".customer_id


-- Get all orders and their line items (orders, quantity and product).
SELECT "orders".id, "orders".order_date, "products".description, "line_items".quantity FROM "orders"
JOIN "line_items" on "orders".id = "line_items".order_id
JOIN "products" on "products".id = "line_items".product_id

-- Which warehouses have cheetos?
SELECT "products".description, "warehouse".warehouse FROM "products"
JOIN "warehouse_product" on "products".id = "warehouse_product".product_id
JOIN "warehouse" on "warehouse_product".warehouse_id = "warehouse".id
WHERE "products".description = 'cheetos'

-- Which warehouses have diet pepsi?
SELECT "products".description, "warehouse".warehouse FROM "products"
JOIN "warehouse_product" on "products".id = "warehouse_product".product_id
JOIN "warehouse" on "warehouse_product".warehouse_id = "warehouse".id
WHERE "products".description = 'diet pepsi'


-- Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT "customers".last_name, COUNT("orders".id) FROM "customers"
JOIN "addresses" on "customers".id = "addresses".customer_id
JOIN "orders" on "addresses".id = "orders".address_id
GROUP BY "customers".last_name


How many customers do we have?
SELECT COUNT(*) from "customers"

How many products do we carry?
SELECT COUNT(*) from "products"

What is the total available on-hand quantity of diet pepsi?

SELECT "products".description, SUM("warehouse_product".on_hand) FROM "products"
JOIN "warehouse_product" on "warehouse_product".product_id = "products".id
WHERE "products".description = 'diet pepsi'
GROUP BY "products".description