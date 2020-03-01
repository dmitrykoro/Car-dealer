
INSERT INTO plant_city (name) VALUES ('Saint-Petersburg');
INSERT INTO plant_city (name) VALUES ('Kaluga');
INSERT INTO plant_city (name) VALUES ('Moscow');

INSERT INTO plant (name, city) VALUES ('AUTOTOR', 1);
INSERT INTO plant (name, city) VALUES ('PSMA', 2);
INSERT INTO plant (name, city) VALUES ('RENAULT-RUS', 3);

INSERT INTO client (name, phone, passport_num) VALUES ('Ivan Ivanov', '89516730906', '4018945657');
INSERT INTO client (name, phone, passport_num) VALUES ('Ivan Petrov', '89756838479', '4067389900');
INSERT INTO client (name, phone, passport_num) VALUES ('Alexey Golubev', '87846748854', '4018945545');
INSERT INTO client (name, phone, passport_num) VALUES ('Fedor Fedorov', '89999902849', '4056940030');

INSERT INTO body (id, type) VALUES (01, 'SUV');
INSERT INTO body (id, type) VALUES (02, 'Sedan');
INSERT INTO body (id, type) VALUES (03, 'Hatchback');
INSERT INTO body (id, type) VALUES (04, 'Station wagon');
INSERT INTO body (id, type) VALUES (05, 'Coupe');

INSERT INTO job (work_description, work_cost)
    VALUES ('MOT-0 gasoline + suspension diagnostics volume under 1.5 liter', 6500);
INSERT INTO job (work_description, work_cost)
    VALUES ('MOT-0 gasoline + suspension diagnostics volume under 2.5 liter', 8500);
INSERT INTO job (work_description, work_cost)
    VALUES ('MOT-0 gasoline + suspension diagnostics volume under 3.5 liter', 10500);
INSERT INTO job (work_description, work_cost)
    VALUES ('MOT-0 diesel + suspension diagnostics volume under 1.5 liter', 7500);
INSERT INTO job (work_description, work_cost)
    VALUES ('MOT-0 diesel + suspension diagnostics commercial', 11500);
INSERT INTO job (work_description, work_cost)
    VALUES ('MOT-1 gasoline + suspension diagnostics volume under 1.5 liter', 6500);
INSERT INTO job (work_description, work_cost)
    VALUES ('MOT-1 gasoline + suspension diagnostics volume under 2.5 liter', 8500);
INSERT INTO job (work_description, work_cost)
    VALUES ('MOT-1 gasoline + suspension diagnostics volume under 3.5 liter', 10500);
INSERT INTO job (work_description, work_cost)
    VALUES ('MOT-1 diesel + suspension diagnostics volume under 1.5 liter', 7500);
INSERT INTO job (work_description, work_cost)
    VALUES ('MOT-1 diesel + suspension diagnostics commercial', 11500);
INSERT INTO job (work_description, work_cost)
    VALUES ('MOT-2 gasoline. Suspension diagnostics, dust filter, spark plugs, volume under 1.5 liter', 8500);
INSERT INTO job (work_description, work_cost)
    VALUES ('MOT-2 gasoline. Suspension diagnostics, dust filter, spark plugs,volume under 2.5 liter', 10500);
INSERT INTO job (work_description, work_cost)
    VALUES ('MOT-2 gasoline. Suspension diagnostics, dust filter, spark plugs, volume under 3.5 liter', 12500);
INSERT INTO job (work_description, work_cost)
    VALUES ('MOT-2 diesel + suspension diagnostics, particulate filters, volume under 1.5 liter', 10500);
INSERT INTO job (work_description, work_cost)
    VALUES ('MOT-2 diesel + suspension diagnostics, particulate filters, commercial', 14500);

INSERT INTO specs (id, engine_code, engine_volume, body_type, door_number, transmission_type, drive_type)
    VALUES (01, 'TU5', 1.6, 2, 4, 'AT', 'FWD');
INSERT INTO specs (id, engine_code, engine_volume, body_type, door_number, transmission_type, drive_type)
    VALUES (02, 'EP6', 1.6, 2, 4, 'AT', 'FWD');
INSERT INTO specs (id, engine_code, engine_volume, body_type, door_number, transmission_type, drive_type)
    VALUES (03, 'H4MD', 1.6, 2, 4, 'CVT', 'FWD');
INSERT INTO specs (id, engine_code, engine_volume, body_type, door_number, transmission_type, drive_type)
    VALUES (04, 'H4MD', 1.6, 1, 4, 'Manual', 'AWD');

INSERT INTO model (name) VALUES ('Arkana');
INSERT INTO model (name) VALUES ('Duster');
INSERT INTO model (name) VALUES ('Dokker');
INSERT INTO model (name) VALUES ('Logan');
INSERT INTO model (name) VALUES ('Koleos');
INSERT INTO model (name) VALUES ('Master');
INSERT INTO model (name) VALUES ('Sandero');

INSERT INTO vehicle (specs_id, model, delivery_date, catalog_price, color, plant_id, date_of_manufacturing)
    VALUES (2, 1, '2019-02-19', 856700, 'black', 1, '2019-01-19');
INSERT INTO vehicle (specs_id, model, delivery_date, catalog_price, color, plant_id, date_of_manufacturing)
    VALUES (4, 3, '2019-12-14', 1100000, 'white', 2, '2019-10-19');
INSERT INTO vehicle (specs_id, model, delivery_date, catalog_price, color, plant_id, date_of_manufacturing)
    VALUES (1, 2, '2020-06-19', 1345000, 'grey', 1, '2019-02-16');
INSERT INTO vehicle (specs_id, model, delivery_date, catalog_price, color, plant_id, date_of_manufacturing)
    VALUES (4, 6, '2020-01-02', 735000, 'orange', 3, '2019-12-15');
INSERT INTO vehicle (specs_id, model, delivery_date, catalog_price, color, plant_id, date_of_manufacturing)
    VALUES (2, 1, '2020-03-14', 2750000, 'blue', 3, '2020-03-02');

INSERT INTO maintenance (vehicle_id, date_of_visit, service_number) VALUES (2, '2020-02-08', 01);
INSERT INTO maintenance (vehicle_id, date_of_visit, service_number) VALUES (1, '2019-08-16', 02);

INSERT INTO people (people_name, address, phone, date_of_entry)
    VALUES ('Alexey Antonov', 'SPB, Slavy ave, 34-567', '89113456732', '2017-03-14');
INSERT INTO people (people_name, address, phone, date_of_entry)
    VALUES ('Ivan Alexeev', 'Moscow, Kedrova st, 11D-56', '89567821991', '2014-12-19');
INSERT INTO people (people_name, address, phone, date_of_entry)
    VALUES ('Fedor Butin', 'SPB, Nevskiy ave, 12-43', '89876534523', '2019-10-10');
INSERT INTO people (people_name, address, phone, date_of_entry)
    VALUES ('Denis Lebedev', 'SPB, Dybenko st, 34-567', '89113675426', '2016-12-01');

INSERT INTO manager (people_id, position, start_date, end_date) VALUES (1, 'sales manager', '2017-03-14', NULL);
INSERT INTO manager (people_id, position, start_date, end_date) VALUES (2, 'top salesman', '2019-01-24', NULL);

INSERT INTO selling (vehicle, client_id, vin, selling_date, subtotal, payment, seller_id)
    VALUES (1, 2, 'X7LLSRMAGH011156', '2019-02-28', 765456, 'card', 2);
INSERT INTO selling (vehicle, client_id, vin, selling_date, subtotal, payment, seller_id)
    VALUES (1, 2, 'X7LLSR657H657489', '2020-01-08', 1350000, 'cash', 1);



