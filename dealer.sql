DROP TABLE IF EXISTS selling CASCADE;
DROP TABLE IF EXISTS client CASCADE;
DROP TABLE IF EXISTS manager CASCADE;
DROP TABLE IF EXISTS people CASCADE;
DROP TABLE IF EXISTS specs CASCADE;
DROP TABLE IF EXISTS plant CASCADE;
DROP TABLE IF EXISTS model CASCADE;
DROP TABLE IF EXISTS vehicle CASCADE;
DROP TABLE IF EXISTS job CASCADE;
DROP TABLE IF EXISTS maintenance CASCADE;

DROP TYPE IF EXISTS PAYMENT_TYPE CASCADE;
DROP TYPE IF EXISTS POST CASCADE;
DROP TYPE IF EXISTS BODY_TYPE CASCADE;
DROP TYPE IF EXISTS DRIVE CASCADE;
DROP TYPE IF EXISTS TRANSMISSION_TYPE CASCADE;
DROP TYPE IF EXISTS PLANT_CITY CASCADE;

CREATE TYPE PAYMENT_TYPE AS ENUM ('cash', 'card');
CREATE TYPE POST AS ENUM ('sales manager', 'top salesman', 'mechanic', 'top mechanic', 'safeguard engineer');
CREATE TYPE BODY_TYPE AS ENUM ('SUV', 'Sedan', 'Hatchback', 'Station wagon', 'Coupe'); --as table
CREATE TYPE DRIVE AS ENUM ('FWD', 'AWD');
CREATE TYPE TRANSMISSION_TYPE AS ENUM ('Manual', 'AT', 'CVT');
CREATE TYPE PLANT_CITY AS ENUM ('Saint-Petersburg', 'Kaluga', 'Toliatti'); --as table

CREATE TABLE client
(
    id                  SERIAL PRIMARY KEY,
    client_name         VARCHAR(200) NOT NULL,
    client_phone        CHAR(11),
    client_passport_num CHAR(10)
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
    people_id   INT REFERENCES people (id),
    id          SERIAL PRIMARY KEY,
    manager_pos POST,
    start_date  DATE NOT NULL,
    end_date    DATE
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

CREATE TABLE model
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(20)
);

CREATE TABLE plant
(
    name VARCHAR(30),
    id   SERIAL PRIMARY KEY,
    city PLANT_CITY
);

CREATE TABLE vehicle
(
    vehicle_id            SERIAL PRIMARY KEY,
    specs_id              INT REFERENCES specs (id),
    vehicle_model         INT REFERENCES model (id),
    delivery_date         DATE,
    catalog_price         INT,
    color                 VARCHAR(20),
    plant_id              SERIAL REFERENCES plant (id),
    date_of_manufacturing DATE
);

CREATE TABLE selling
(
    vehicle      INT REFERENCES vehicle (vehicle_id),
    client_id    INT REFERENCES client (id),
    VIN          CHAR(17) PRIMARY KEY NOT NULL,
    selling_date DATE,
    subtotal     INTEGER,
    payment      PAYMENT_TYPE,
    seller_id    INT REFERENCES manager (id)
);

CREATE TABLE job
(
    id               INT PRIMARY KEY,
    work_description VARCHAR(5000),
    work_cost        INT
);

CREATE TABLE maintenance
(
    id             SERIAL PRIMARY KEY,
    vehicle_id     INT REFERENCES vehicle (vehicle_id),
    date_of_visit  DATE,
    service_number INTEGER REFERENCES job (id)
);
