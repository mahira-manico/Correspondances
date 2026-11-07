INSERT INTO train(train_number)
SELECT 'TER-' || (8755+i)
FROM pg_catalog.generate_series(1,36) AS s(i);

INSERT INTO carriage(train_id,carriage_number)
SELECT t.train_id,c.num
FROM train t
         CROSS JOIN pg_catalog.generate_series(1,5) AS c(num);

INSERT INTO seat(carriage_id,travel_class_id,seat_number)
SELECT c.carriage_id,
       CASE
           WHEN c.carriage_number=1 THEN (SELECT travel_id FROM travel_class WHERE code='FIRST')
           ELSE (SELECT travel_class_id FROM travel_class WHERE code='SECOND')
           END ,
       s.num
FROM carriage c
         CROSS JOIN pg_catalog.generate_series(1,60) AS s(num);



