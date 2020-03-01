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
DROP TABLE IF EXISTS body CASCADE;
DROP TABLE IF EXISTS plant_city CASCADE;

DROP TYPE IF EXISTS PAYMENT_TYPE CASCADE;
DROP TYPE IF EXISTS POST CASCADE;
DROP TYPE IF EXISTS DRIVE CASCADE;
DROP TYPE IF EXISTS TRANSMISSION_TYPE CASCADE;

CREATE TYPE PAYMENT_TYPE AS ENUM ('cash', 'card');
CREATE TYPE POST AS ENUM ('sales manager', 'top salesman', 'mechanic', 'top mechanic', 'safeguard engineer');
CREATE TYPE DRIVE AS ENUM ('FWD', 'AWD');
CREATE TYPE TRANSMISSION_TYPE AS ENUM ('Manual', 'AT', 'CVT');


CREATE TABLE plant_city
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(30)
);

CREATE TABLE client
(
    id           SERIAL PRIMARY KEY,
    name         VARCHAR(200) NOT NULL,
    phone        CHAR(11),
    passport_num CHAR(10)
);

CREATE TABLE people
(
    people_name   VARCHAR(200) NOT NULL,
    id            SERIAL PRIMARY KEY,
    address       VARCHAR(300),
    phone         CHAR(11),
    date_of_entry DATE
);

CREATE TABLE manager
(
    people_id  INT REFERENCES people (id),
    id         SERIAL PRIMARY KEY,
    position   POST,
    start_date DATE NOT NULL,
    end_date   DATE
);

CREATE TABLE body
(
    id   INT PRIMARY KEY UNIQUE,
    type VARCHAR(15)
);

CREATE TABLE specs
(
    id                INT PRIMARY KEY,
    engine_code       VARCHAR(20) NOT NULL,
    engine_volume     FLOAT     NOT NULL,
    body_type         INT REFERENCES body (id),
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
    city INT REFERENCES plant_city (id)
);

CREATE TABLE vehicle
(
    id                    SERIAL PRIMARY KEY,
    specs_id              INT REFERENCES specs (id),    --on delete
    model                 INT REFERENCES model (id),
    delivery_date         DATE,
    catalog_price         INT,
    color                 VARCHAR(20),
    plant_id              SERIAL REFERENCES plant (id), --
    date_of_manufacturing DATE
);

CREATE TABLE selling
(
    vehicle      INT REFERENCES vehicle (id),
    client_id    INT REFERENCES client (id),
    VIN          CHAR(17) PRIMARY KEY NOT NULL,
    selling_date DATE,
    subtotal     INTEGER,
    payment      PAYMENT_TYPE,
    seller_id    INT REFERENCES manager (id)
);

CREATE TABLE job
(
    id               SERIAL PRIMARY KEY,
    work_description VARCHAR(5000),
    work_cost        INT
);

CREATE TABLE maintenance
(
    id             SERIAL PRIMARY KEY,
    vehicle_id     INT REFERENCES vehicle (id),
    date_of_visit  DATE,
    service_number INTEGER REFERENCES job (id)
);
