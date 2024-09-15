CREATE SCHEMA assignment_12;

CREATE TABLE `pizzas` (
	`pizza_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`item_name` VARCHAR(20) NOT NULL,
    `price` DECIMAL(4,2)
    );
    
INSERT INTO `pizzas` (item_name, price)
	VALUES ('Pepperoni & Cheese', 7.99),
	('Vegetarian', 9.99),
	('Meat Lovers', 14.99),
	('Hawaiian', 12.99);
   
CREATE TABLE `orders` (
	`order_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `customer_name` VARCHAR(20) NOT NULL,
    `phone` VARCHAR(15) NOT NULL,
    `date_time` DATETIME NOT NULL
    );

CREATE TABLE `order_items` (
    `order_id` INT NOT NULL,
    `pizza_id` INT NOT NULL,
    `quantity` INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES `orders` (order_id),
    FOREIGN KEY (pizza_id) REFERENCES `pizzas` (pizza_id)
    );
    
INSERT INTO `orders` (customer_name, phone, date_time)
VALUES ('Trevor Page', '226-555-4982', '2023-9-10 9:47:00'),
	('John Doe', '555-555-9498', '2023-9-10 13:20:00'),
    ('Trevor Page', '226-555-4982', '2023-9-10 9:47:00'),
    ('John Doe', '555-555-9498', '2023-10-10 10:37:00');

INSERT INTO `order_items` (order_id, pizza_id, quantity)
VALUES (1, 1, 1),
	(1, 3, 1),
    (2, 2, 1),
    (2, 3, 2),
    (3, 3, 1),
    (3, 4, 1),
    (4, 2, 3),
    (4, 4, 1);

SELECT customer_name as Customer, sum(price * quantity) AS Total
FROM `orders` o
JOIN `order_items` oi ON o.order_id = oi.order_id
JOIN `pizzas` p ON oi.pizza_id = p.pizza_id
GROUP BY customer_name;

SELECT customer_name as Customer, date_time AS Date, sum(price * quantity) AS Total
FROM `orders` o
JOIN `order_items` oi ON o.order_id = oi.order_id
JOIN `pizzas` p ON oi.pizza_id = p.pizza_id
GROUP BY customer_name, date_time;