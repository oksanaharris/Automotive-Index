CREATE USER indexed_cars_user;

CREATE DATABASE indexed_cars WITH OWNER indexed_cars_user;

SELECT make_title FROM car_models WHERE make_code = 'LAM' GROUP BY make_title;
-- time: 25.181 ms
-- time: 1.243 ms - with make_code_index ONLY
-- Time: 1.148 ms - with make_code_index AND model_title_index
-- Time: 32.418 ms - with model_title_index ONLY
-- Time: 32.243 ms - with make_title_index ONLY
-- Time: 1.173 ms - with make_code_index AND make_title_index
-- Time: 1.326 ms - with all three: make_code, model_title, make_title
-- Time: 1.171 ms - with all four: make_code, model_code, model_title, make_title
-- Time: 1.021 ms - with all four and year

SELECT model_title FROM car_models WHERE make_code = 'NISSAN' AND model_code = 'GT-R' GROUP BY model_title;
-- time: 31.340 ms
-- Time: 2.141 ms - with make_code_index
-- Time: 1.945 ms - with make_code_index AND model_title_index
-- Time: 32.678 ms - with model_title_index ONLY
-- Time: 32.257 ms - with make_title_index ONLY
-- Time: 1.994 ms - with make_code_index ONLY AND make_title_index
-- Time: 1.983 ms - with all three: make_code, model_title, make_title
-- Time: 1.154 ms - with all four: make_code, model_code, model_title, make_title
-- Time: 1.571 ms - with all four and year - with all four and year

SELECT make_code, model_code, model_title, year FROM car_models WHERE make_code = 'LAM';
-- Time: 32.835 ms
-- Time: 1.516 ms - with make_code_index
-- Time: 1.503 ms - with make_code_index AND model_title_index
-- Time: 33.329 ms - with model_title_index ONLY
-- Time: 32.691 ms - with make_title_index ONLY
-- Time: 1.522 ms - with make_code_index AND make_title_index
-- Time: 1.740 ms - with all three: make_code, model_title, make_title
-- Time: 1.544 ms - with all four: make_code, model_code, model_title, make_title
-- Time: 1.513 ms - with all four and year - with all four and year

SELECT * FROM car_models WHERE year BETWEEN 2010 AND 2015;
-- Time: 79.540 ms
-- Time: 70.314 ms - with make_code_index
-- Time: 68.554 ms - with make_code_index AND model_title_index
-- Time: 66.196 ms - with model_title_index ONLY
-- Time: 69.957 ms - with make_title_index ONLY
-- Time: 73.995 ms - with make_code_index AND make_title_index
-- Time: 67.092 ms - with all three: make_code, model_title, make_title
-- Time: 62.283 ms - with all four and year

SELECT * FROM car_models WHERE year = 2010;
-- Time: 44.501 ms
-- Time: 41.913 ms - with make_code_index
-- Time: 44.981 ms - with make_code_index AND model_title_index
-- Time: 42.646 ms - with model_title_index ONLY
-- Time: 47.711 ms - with make_title_index ONLY
-- Time: 44.282 ms - with make_code_index AND make_title_index
-- Time: 45.312 ms - with all three: make_code, model_title, make_title
-- Time: 14.145 ms - with all four and year

CREATE INDEX make_code_index
  ON car_models (make_code);

CREATE INDEX model_title_index
  ON car_models (model_title);

CREATE INDEX make_title_index
  ON car_models (make_title);

CREATE INDEX model_code_index
  ON car_models (model_code);

CREATE INDEX year_index
  ON car_models (year);