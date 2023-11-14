/* Create bob's microphone purchase 
and alice's spatula purchase in one single SQL statement */
INSERT INTO purchases (customer_id, item_id, quantity)
VALUES 
(1, 1, 1),
(2, 2, 5);