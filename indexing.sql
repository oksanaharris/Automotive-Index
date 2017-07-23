CREATE USER indexed_cars_user;

CREATE DATABASE indexed_cars WITH OWNER indexed_cars_user;

SELECT make_title FROM car_models WHERE make_code = 'LAM' GROUP BY make_title;
-- time: 25.181 ms

SELECT model_title FROM car_models WHERE make_code = 'NISSAN' AND model_code = 'GT-R' GROUP BY model_title;
-- time: 31.340 ms

SELECT make_code, model_code, model_title, year FROM car_models WHERE make_code = 'LAM';
-- Time: 32.835 ms

SELECT * FROM car_models WHERE year BETWEEN 2010 AND 2015;
-- Time: 79.540 ms

SELECT * FROM car_models WHERE year = 2010;
-- Time: 44.501 ms