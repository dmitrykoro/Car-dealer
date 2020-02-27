DROP TABLE IF EXISTS selling CASCADE;
DROP TABLE IF EXISTS client;
DROP TABLE IF EXISTS manager;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS specs CASCADE;
DROP TABLE IF EXISTS plant CASCADE;
DROP TABLE IF EXISTS models CASCADE;
DROP TABLE IF EXISTS vehicle;
DROP TABLE IF EXISTS jobs;
DROP TABLE IF EXISTS maintenance;

DROP TYPE IF EXISTS PAYMENT_TYPE;
DROP TYPE IF EXISTS POST;
DROP TYPE IF EXISTS BODY_TYPE;
DROP TYPE IF EXISTS DRIVE;
DROP TYPE IF EXISTS TRANSMISSION_TYPE;
DROP TYPE IF EXISTS PLANT_CITY;

CREATE TYPE PAYMENT_TYPE AS ENUM ('cash', 'card');
CREATE TYPE POST AS ENUM ('sales manager', 'top salesman', 'mechanic', 'top mechanic', 'safeguard engineer');
CREATE TYPE BODY_TYPE AS ENUM ('SUV', 'Sedan', 'Hatchback', 'Station wagon', 'Coupe');
CREATE TYPE DRIVE AS ENUM ('FWD', 'AWD');
CREATE TYPE TRANSMISSION_TYPE AS ENUM ('Manual', 'AT', 'CVT');
CREATE TYPE PLANT_CITY AS ENUM ('Saint-Petersburg', 'Kaluga', 'Toliatti');

CREATE TABLE client
(
    id                  SERIAL PRIMARY KEY,
    client_name         VARCHAR(200) NOT NULL,
    client_phone        INTEGER,
    client_passport_num INTEGER
);

CREATE TABLE people
(
    people_name   VARCHAR(200) NOT NULL,
    id            SERIAL PRIMARY KEY,
    address       VARCHAR(300),
    phone         INTEGER,
    date_of_entry DATE
);

CREATE TABLE manager
(
    people_id   INT UNIQUE,
    record_id   SERIAL PRIMARY KEY REFERENCES people (id),
    manager_pos POST
);

CREATE TABLE selling
(
    vehicle_id   SERIAL PRIMARY KEY,
    client_id    INT REFERENCES client (id),
    VIN          VARCHAR(17) NOT NULL,
    selling_date DATE,
    subtotal     INTEGER,
    payment      PAYMENT_TYPE,
    seller_id    INT REFERENCES manager (people_id)
);

CREATE TABLE specs
(
    id                INT PRIMARY KEY,
    engine_code       VARCHAR(20) NOT NULL,
    engine_volume     INTEGER     NOT NULL,
    body_type         BODY_TYPE,
    door_number       INT,
    transmission_type TRANSMISSION_TYPE,
    drive_type        DRIVE
);

CREATE TABLE plant
(
    id   SERIAL PRIMARY KEY,
    city PLANT_CITY
);

CREATE TABLE models
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(20)
);

CREATE TABLE vehicle
(
    vehicle_id            SERIAL PRIMARY KEY REFERENCES selling (vehicle_id) REFERENCES models (id),
    specs_id              INT REFERENCES specs,
    vehicle_model         VARCHAR(20) NOT NULL,
    delivery_date         DATE,
    catalog_price         INT,
    color                 VARCHAR(20),
    plant_id              SERIAL REFERENCES plant (id),
    date_of_manufacturing DATE
);

CREATE TABLE jobs
(
    id               INT PRIMARY KEY,
    work_description VARCHAR(5000),
    work_cost        INT
);

CREATE TABLE maintenance
(
    VIN            VARCHAR(17),
    client_id      SERIAL PRIMARY KEY REFERENCES client (id),
    date_of_visit  DATE,
    service_number INTEGER REFERENCES jobs (id)
);



