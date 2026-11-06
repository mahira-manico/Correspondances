CREATE TABLE station (
    station_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    code       VARCHAR(10)  NOT NULL UNIQUE,
    name       VARCHAR(100) NOT NULL,
    city       VARCHAR(100) NOT NULL
);

CREATE TABLE line (
    line_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    code    VARCHAR(10)  NOT NULL UNIQUE,
    name    VARCHAR(100) NOT NULL
);

CREATE TABLE line_station (
    line_station_id      INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    line_id              INTEGER      NOT NULL,
    station_id           INTEGER      NOT NULL,
    stop_order           SMALLINT     NOT NULL,
    distance_from_origin NUMERIC(6,1) NOT NULL,
    CONSTRAINT fk_line_station_line    FOREIGN KEY (line_id)    REFERENCES line (line_id)       ON DELETE CASCADE,
    CONSTRAINT fk_line_station_station FOREIGN KEY (station_id) REFERENCES station (station_id) ON DELETE RESTRICT,
    CONSTRAINT uq_line_station    UNIQUE (line_id, station_id),
    CONSTRAINT uq_line_stop_order UNIQUE (line_id, stop_order),
    CONSTRAINT ck_stop_order        CHECK (stop_order > 0),
    CONSTRAINT ck_distance_positive CHECK (distance_from_origin >= 0)
);

CREATE TABLE calendar (
    calendar_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    code        VARCHAR(20)  NOT NULL UNIQUE,
    label       VARCHAR(100) NOT NULL,
    monday      BOOLEAN NOT NULL DEFAULT FALSE,
    tuesday     BOOLEAN NOT NULL DEFAULT FALSE,
    wednesday   BOOLEAN NOT NULL DEFAULT FALSE,
    thursday    BOOLEAN NOT NULL DEFAULT FALSE,
    friday      BOOLEAN NOT NULL DEFAULT FALSE,
    saturday    BOOLEAN NOT NULL DEFAULT FALSE,
    sunday      BOOLEAN NOT NULL DEFAULT FALSE,
    valid_from  DATE NOT NULL,
    valid_to    DATE NOT NULL,
    CONSTRAINT ck_calendar_validity CHECK (valid_from <= valid_to)
);

CREATE TABLE calendar_exception (
    exception_id   INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    calendar_id    INTEGER    NOT NULL,
    exception_date DATE       NOT NULL,
    exception_type VARCHAR(7) NOT NULL,
    CONSTRAINT fk_exception_calendar FOREIGN KEY (calendar_id) REFERENCES calendar (calendar_id) ON DELETE CASCADE,
    CONSTRAINT uq_exception_calendar_date UNIQUE (calendar_id, exception_date),
    CONSTRAINT ck_exception_type CHECK (exception_type IN ('ADDED', 'REMOVED'))
);

CREATE TABLE train (
    train_id     INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    train_number VARCHAR(10) NOT NULL UNIQUE
);

CREATE TABLE travel_class (
    travel_class_id SMALLINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    code            VARCHAR(10) NOT NULL UNIQUE,
    label           VARCHAR(50) NOT NULL
);

CREATE TABLE carriage (
    carriage_id     INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    train_id        INTEGER  NOT NULL,
    carriage_number SMALLINT NOT NULL,
    CONSTRAINT fk_carriage_train FOREIGN KEY (train_id) REFERENCES train (train_id) ON DELETE CASCADE,
    CONSTRAINT uq_train_carriage UNIQUE (train_id, carriage_number),
    CONSTRAINT ck_carriage_number CHECK (carriage_number > 0)
);

CREATE TABLE seat (
    seat_id         INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    carriage_id     INTEGER  NOT NULL,
    travel_class_id SMALLINT NOT NULL,
    seat_number     SMALLINT NOT NULL,
    CONSTRAINT fk_seat_carriage     FOREIGN KEY (carriage_id)     REFERENCES carriage (carriage_id)         ON DELETE CASCADE,
    CONSTRAINT fk_seat_travel_class FOREIGN KEY (travel_class_id) REFERENCES travel_class (travel_class_id) ON DELETE RESTRICT,
    CONSTRAINT uq_carriage_seat UNIQUE (carriage_id, seat_number),
    CONSTRAINT ck_seat_number CHECK (seat_number > 0)
);

CREATE TABLE train_trip (
    trip_id     INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    trip_number VARCHAR(10) NOT NULL UNIQUE,
    line_id     INTEGER NOT NULL,
    calendar_id INTEGER NOT NULL,
    train_id    INTEGER NOT NULL,
    CONSTRAINT fk_trip_line     FOREIGN KEY (line_id)     REFERENCES line (line_id)         ON DELETE RESTRICT,
    CONSTRAINT fk_trip_calendar FOREIGN KEY (calendar_id) REFERENCES calendar (calendar_id) ON DELETE RESTRICT,
    CONSTRAINT fk_trip_train    FOREIGN KEY (train_id)    REFERENCES train (train_id)       ON DELETE RESTRICT
);

CREATE TABLE stop_time (
    stop_time_id   INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    trip_id        INTEGER  NOT NULL,
    station_id     INTEGER  NOT NULL,
    stop_sequence  SMALLINT NOT NULL,
    arrival_time   TIME     NOT NULL,
    departure_time TIME     NOT NULL,
    CONSTRAINT fk_stop_trip    FOREIGN KEY (trip_id)    REFERENCES train_trip (trip_id)  ON DELETE CASCADE,
    CONSTRAINT fk_stop_station FOREIGN KEY (station_id) REFERENCES station (station_id) ON DELETE RESTRICT,
    CONSTRAINT uq_trip_station  UNIQUE (trip_id, station_id),
    CONSTRAINT uq_trip_sequence UNIQUE (trip_id, stop_sequence),
    CONSTRAINT ck_stop_sequence           CHECK (stop_sequence > 0),
    CONSTRAINT ck_arrival_departure_order CHECK (arrival_time <= departure_time)
);

CREATE TABLE run (
    run_id   INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    trip_id  INTEGER NOT NULL,
    run_date DATE    NOT NULL,
    CONSTRAINT fk_run_trip FOREIGN KEY (trip_id) REFERENCES train_trip (trip_id) ON DELETE RESTRICT,
    CONSTRAINT uq_trip_run_date UNIQUE (trip_id, run_date)
);

CREATE TABLE fare_period (
    fare_period_id SMALLINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    code           VARCHAR(20) NOT NULL UNIQUE,
    label          VARCHAR(50) NOT NULL
);

CREATE TABLE passenger_profile (
    passenger_profile_id SMALLINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    code                 VARCHAR(20) NOT NULL UNIQUE,
    label                VARCHAR(50) NOT NULL
);

CREATE TABLE fare (
    fare_id              INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    travel_class_id      SMALLINT     NOT NULL,
    fare_period_id       SMALLINT     NOT NULL,
    passenger_profile_id SMALLINT     NOT NULL,
    base_price           NUMERIC(8,2) NOT NULL,
    price_per_km         NUMERIC(6,4) NOT NULL,
    CONSTRAINT fk_fare_travel_class FOREIGN KEY (travel_class_id)      REFERENCES travel_class (travel_class_id)           ON DELETE RESTRICT,
    CONSTRAINT fk_fare_period       FOREIGN KEY (fare_period_id)       REFERENCES fare_period (fare_period_id)             ON DELETE RESTRICT,
    CONSTRAINT fk_fare_profile      FOREIGN KEY (passenger_profile_id) REFERENCES passenger_profile (passenger_profile_id) ON DELETE RESTRICT,
    CONSTRAINT uq_fare_dimensions UNIQUE (travel_class_id, fare_period_id, passenger_profile_id),
    CONSTRAINT ck_base_price    CHECK (base_price >= 0),
    CONSTRAINT ck_price_per_km  CHECK (price_per_km >= 0)
);

CREATE TABLE passenger (
    passenger_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    last_name    VARCHAR(100) NOT NULL,
    first_name   VARCHAR(100) NOT NULL,
    email        VARCHAR(255) NOT NULL,
    birth_date   DATE
);

CREATE TABLE booking (
    booking_id   BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    passenger_id BIGINT        NOT NULL,
    booked_at    TIMESTAMPTZ   NOT NULL DEFAULT now(),
    total_price  NUMERIC(10,2) NOT NULL,
    CONSTRAINT fk_booking_passenger FOREIGN KEY (passenger_id) REFERENCES passenger (passenger_id) ON DELETE RESTRICT,
    CONSTRAINT ck_total_price CHECK (total_price >= 0)
);

CREATE TABLE booking_segment (
    booking_segment_id   BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    booking_id           BIGINT       NOT NULL,
    run_id               INTEGER      NOT NULL,
    seat_id              INTEGER      NOT NULL,
    fare_id              INTEGER      NOT NULL,
    departure_station_id INTEGER      NOT NULL,
    arrival_station_id   INTEGER      NOT NULL,
    price                NUMERIC(8,2) NOT NULL,
    CONSTRAINT fk_segment_booking     FOREIGN KEY (booking_id)           REFERENCES booking (booking_id) ON DELETE CASCADE,
    CONSTRAINT fk_segment_run         FOREIGN KEY (run_id)               REFERENCES run (run_id)         ON DELETE RESTRICT,
    CONSTRAINT fk_segment_seat        FOREIGN KEY (seat_id)              REFERENCES seat (seat_id)       ON DELETE RESTRICT,
    CONSTRAINT fk_segment_fare        FOREIGN KEY (fare_id)              REFERENCES fare (fare_id)       ON DELETE RESTRICT,
    CONSTRAINT fk_segment_dep_station FOREIGN KEY (departure_station_id) REFERENCES station (station_id) ON DELETE RESTRICT,
    CONSTRAINT fk_segment_arr_station FOREIGN KEY (arrival_station_id)   REFERENCES station (station_id) ON DELETE RESTRICT,
    CONSTRAINT uq_segment_run_seat UNIQUE (booking_segment_id, run_id, seat_id),
    CONSTRAINT ck_price_positive   CHECK (price >= 0),
    CONSTRAINT ck_segment_stations CHECK (departure_station_id <> arrival_station_id)
);

CREATE TABLE reserved_leg (
    reserved_leg_id    BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    booking_segment_id BIGINT  NOT NULL,
    run_id             INTEGER NOT NULL,
    seat_id            INTEGER NOT NULL,
    station_id         INTEGER NOT NULL,
    CONSTRAINT fk_leg_segment FOREIGN KEY (booking_segment_id, run_id, seat_id)
        REFERENCES booking_segment (booking_segment_id, run_id, seat_id) ON DELETE CASCADE,
    CONSTRAINT fk_leg_station FOREIGN KEY (station_id) REFERENCES station (station_id) ON DELETE RESTRICT,
    CONSTRAINT uq_run_seat_station UNIQUE (run_id, seat_id, station_id)
);
