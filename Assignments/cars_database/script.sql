
-- SELECT  CONCAT(AppUser.first_name, ' ', AppUser.last_name) as full_name, COUNT(Advertisement.car_id) as number_of_ads,CarModel.make, CarModel.model, Car.number_of_owners, Car.manufacture_year, Car.mileage
-- FROM AppUser
-- JOIN Advertisement ON AppUser.account_id=Advertisement.seller_account_id
-- JOIN Car ON Advertisement.car_id=Car.car_id
-- JOIN CarModel ON Car.car_model_id=CarModel.car_model_id
-- WHERE Car.manufacture_year > 2013 AND Car.mileage < 100000 AND CarModel.make != 'BMW' AND CarModel.make != 'Peugeot' AND CarModel.make != 'Opel'
-- GROUP BY full_name, CarModel.make, CarModel.model, Car.manufacture_year, Car.mileage,Car.number_of_owners;

-- How many app users are there?
-- SELECT COUNT(*) FROM AppUser;

--How many app users have a first name beginning with "R".
-- SELECT last_name 
-- FROM AppUser
-- ORDER BY last_name
-- LIMIT 5;

--What is the average mileage of a car?
-- SELECT AVG (mileage)
-- FROM car;

--What is the average mileage of a car with 3 or more previous owners?
-- SELECT AVG (mileage)
-- FROM car
-- WHERE number_of_owners >= 3;

-- What is the average mileage of a car with 3 or more previous owners manufactured after 2008?
-- SELECT AVG (mileage)
-- FROM car
-- WHERE number_of_owners >= 3 AND manufacture_year > 2008;

--How long is the longest model name?
-- SELECT MAX (length(model)) 
-- FROM CarModel
-- LIMIT 1;

--How many users live in Chicago?
-- SELECT COUNT(*)
-- FROM UserProfile
-- WHERE city = 'Chicago'

--How many users live in cities with the word "Park" in their name?
-- SELECT COUNT(*)
-- FROM UserProfile
-- WHERE city LIKE '%Park%'

-- Queries 2
-- Get the count of users per city.
-- SELECT COUNT(*), city
-- FROM UserProfile
-- GROUP BY city;

-- Get the count of users per city, excluding Chicago.
-- SELECT COUNT(*), city
-- FROM UserProfile
-- WHERE city != 'Chicago'
-- GROUP BY city;

-- Get the number of advertisements per date in descending order.
-- SELECT COUNT(*), advertisement_date
-- FROM Advertisement
-- GROUP BY advertisement_date
-- ORDER BY advertisement_date DESC;

--Get the number of advertisements per date before February, 2014 in descending order.
-- SELECT COUNT(*), advertisement_date
-- FROM Advertisement
-- WHERE advertisement_date < '2014-02-01'
-- GROUP BY advertisement_date
-- ORDER BY advertisement_date DESC;

-- Get the number of advertisements per month.
-- SELECT
--     EXTRACT(MONTH FROM advertisement_date) AS month,
--     COUNT(*) AS total_records
-- FROM
--     Advertisement
-- GROUP BY
--     EXTRACT(MONTH FROM advertisement_date)
-- ORDER BY
--     month;

-- What are the first names of users who placed ads in June of 2015
-- SELECT Advertisement.advertisement_date, AppUser.first_name
-- FROM AppUser
-- JOIN Advertisement ON Advertisement.seller_account_id = AppUser.account_id
-- WHERE Advertisement.advertisement_date BETWEEN '2014-06-01' AND '2014-06-30';

-- What are the makes of cars that Wilda Giguere advertised?
SELECT CarModel.make, CarModel.model
FROM CarModel
JOIN Car ON Car.car_id = CarModel.car_model_id
JOIN Advertisement ON Advertisement.car_id = Car.car_id
JOIN AppUser ON Advertisement.seller_account_id = AppUser.account_id
Where AppUser.first_name = 'Wilda' AND AppUser.last_name = 'Giguere';