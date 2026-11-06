CREATE TABLE Station(
    id BIGSERIAL PRIMARY KEY,
    code VARCHAR(10) NOT NULL UNIQUE,
    name VARCHAR(100) NOT NULL UNIQUE,
    city VARCHAR(100) NOT NULL
);

CREATE TABLE Line(
   id BIGSERIAL PRIMARY KEY,
   code VARCHAR(10) NOT NULL UNIQUE,
   name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Train(
    id BIGSERIAL PRIMARY KEY,
    train_number VARCHAR(10) NOT NULL UNIQUE
);

CREATE TABLE TravelClass(
    id SMALLSERIAL PRIMARY KEY,
    code VARCHAR(10) NOT NULL UNIQUE,
    label VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Calendar(
    id BIGSERIAL PRIMARY KEY,
    code VARCHAR(20) NOT NULL UNIQUE,
    label VARCHAR(100) NOT NULL,
    monday BOOLEAN NOT NULL DEFAULT FALSE,
    tuesday BOOLEAN NOT NULL DEFAULT FALSE,
    wednesday BOOLEAN NOT NULL DEFAULT FALSE,
    thursday BOOLEAN NOT NULL DEFAULT FALSE,
    friday BOOLEAN NOT NULL DEFAULT FALSE,
    saturday BOOLEAN NOT NULL DEFAULT FALSE,
    sunday BOOLEAN NOT NULL DEFAULT FALSE,
    valid_from DATE NOT NULL,
    valid_to DATE NOT NULL
);

CREATE TABLE CalendarException(
    id BIGSERIAL PRIMARY KEY,
    calendar_id BIGINT NOT NULL,
    exception_date DATE NOT NULL,
    exception_type VARCHAR(7) NOT NULL,
    CONSTRAINT fk_exception_calendar FOREIGN KEY (calendar_id) REFERENCES Calendar(id) ON DELETE CASCADE,
    CONSTRAINT uq_exception_calendar_date UNIQUE (calendar_id, exception_date)
);

CREATE TABLE FarePeriod(
    id SMALLSERIAL PRIMARY KEY,
    code VARCHAR(20) NOT NULL UNIQUE,
    label VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE PassengerProfile(
    id SMALLSERIAL PRIMARY KEY,
    code VARCHAR(20) NOT NULL UNIQUE,
    label VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Passenger(
    id BIGSERIAL PRIMARY KEY,
    last_name VARCHAR(100) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    birth_date DATE
);

CREATE TABLE Carriage(
    id BIGSERIAL PRIMARY KEY,
    train_id BIGINT NOT NULL,
    carriage_number SMALLINT NOT NULL,
    CONSTRAINT fk_carriage_train FOREIGN KEY (train_id) REFERENCES Train(id) ON DELETE CASCADE,
    CONSTRAINT uq_train_carriage UNIQUE (train_id, carriage_number),
    CONSTRAINT ck_carriage_number CHECK (carriage_number>0)
);

CREATE TABLE Seat(
    id BIGSERIAL PRIMARY KEY,
    carriage_id BIGINT NOT NULL,
    travel_class_id SMALLINT NOT NULL,
    seat_number SMALLINT NOT NULL,
    CONSTRAINT fk_seat_carriage FOREIGN KEY (carriage_id) REFERENCES Carriage(id) ON DELETE CASCADE,
    CONSTRAINT fk_seat_travel_class FOREIGN KEY (travel_class_id) REFERENCES TravelClass(id),
    CONSTRAINT uq_carriage_seat UNIQUE (carriage_id, seat_number),
    CONSTRAINT ck_seat_number CHECK (seat_number>0)
);

CREATE TABLE LineStation(
    id BIGSERIAL PRIMARY KEY,
    line_id BIGINT NOT NULL,
    station_id BIGINT NOT NULL,
    stop_order SMALLINT NOT NULL,
    distance_from_origin NUMERIC(6,1) NOT NULL,
    CONSTRAINT fk_line_station_line FOREIGN KEY (line_id) REFERENCES Line(id) ON DELETE CASCADE,
    CONSTRAINT fk_line_station_station FOREIGN KEY (station_id) REFERENCES Station(id),
    CONSTRAINT uq_line_stop_order UNIQUE (line_id, stop_order),
    CONSTRAINT uq_line_station UNIQUE (line_id, station_id),
    CONSTRAINT ck_stop_order CHECK (stop_order>0),
    CONSTRAINT ck_distance_positive CHECK (distance_from_origin>=0)
);

CREATE TABLE TrainTrip(
    id BIGSERIAL PRIMARY KEY,
    trip_number VARCHAR(10) NOT NULL UNIQUE,
    line_id BIGINT NOT NULL,
    calendar_id BIGINT NOT NULL,
    train_id BIGINT NOT NULL,
    CONSTRAINT fk_trip_line FOREIGN KEY (line_id) REFERENCES Line(id),
    CONSTRAINT fk_trip_calendar FOREIGN KEY (calendar_id) REFERENCES Calendar(id),
    CONSTRAINT fk_trip_train FOREIGN KEY (train_id) REFERENCES Train(id)
);

CREATE TABLE StopTime(
    id BIGSERIAL PRIMARY KEY,
    trip_id BIGINT NOT NULL,
    station_id BIGINT NOT NULL,
    stop_sequence SMALLINT NOT NULL,
    arrival_time TIME NOT NULL,
    departure_time TIME NOT NULL,
    CONSTRAINT fk_stop_trip FOREIGN KEY (trip_id) REFERENCES TrainTrip(id) ON DELETE CASCADE,
    CONSTRAINT fk_stop_station FOREIGN KEY (station_id) REFERENCES Station(id),
    CONSTRAINT uq_trip_station UNIQUE (trip_id, station_id),
    CONSTRAINT uq_trip_sequence UNIQUE (trip_id, stop_sequence),
    CONSTRAINT ck_arrival_departure_order CHECK (arrival_time<=departure_time)
);

CREATE TABLE Run(
    id BIGSERIAL PRIMARY KEY,
    trip_id BIGINT NOT NULL,
    run_date DATE NOT NULL,
    CONSTRAINT fk_run_trip FOREIGN KEY (trip_id) REFERENCES TrainTrip(id) ON DELETE CASCADE,
    CONSTRAINT uq_trip_run_date UNIQUE (trip_id, run_date)
);

CREATE TABLE Fare(
    id BIGSERIAL PRIMARY KEY,
    base_price NUMERIC(8,2) NOT NULL,
    price_per_km NUMERIC(6,4) NOT NULL,
    passenger_profile_id SMALLINT NOT NULL,
    fare_period_id SMALLINT NOT NULL,
    travel_class_id BIGINT NOT NULL,
    CONSTRAINT fk_fare_profile FOREIGN KEY (passenger_profile_id) REFERENCES PassengerProfile(id),
    CONSTRAINT fk_fare_period FOREIGN KEY (fare_period_id) REFERENCES FarePeriod(id),
    CONSTRAINT fk_fare_travel_class FOREIGN KEY (travel_class_id) REFERENCES TravelClass(id),
    CONSTRAINT uq_fare_dimensions UNIQUE (passenger_profile_id, fare_period_id, travel_class_id),
    CONSTRAINT ck_base_price CHECK (base_price>=0),
    CONSTRAINT ck_price_per_km CHECK (price_per_km>=0)
);

CREATE TABLE Booking(
    id BIGSERIAL PRIMARY KEY,
    passenger_id BIGINT NOT NULL,
    booked_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    total_price NUMERIC(10,2) NOT NULL,
    CONSTRAINT fk_booking_passenger FOREIGN KEY (passenger_id) REFERENCES Passenger(id),
    CONSTRAINT ck_total_price CHECK (total_price>=0)
);

CREATE TABLE BookingSegment(
    id BIGSERIAL PRIMARY KEY,
    booking_id BIGINT NOT NULL,
    run_id BIGINT NOT NULL,
    seat_id BIGINT NOT NULL,
    fare_id BIGINT NOT NULL,
    station_departure_id BIGINT NOT NULL,
    station_arrival_id BIGINT NOT NULL,
    price NUMERIC(8,2) NOT NULL,
    CONSTRAINT fk_segment_booking FOREIGN KEY (booking_id) REFERENCES Booking(id) ON DELETE CASCADE,
    CONSTRAINT fk_segment_run FOREIGN KEY (run_id) REFERENCES Run(id),
    CONSTRAINT fk_segment_seat FOREIGN KEY (seat_id) REFERENCES Seat(id),
    CONSTRAINT fk_segment_fare FOREIGN KEY (fare_id) REFERENCES Fare(id),
    CONSTRAINT fk_segment_dep_station FOREIGN KEY (station_departure_id) REFERENCES Station(id),
    CONSTRAINT fk_segment_arr_station FOREIGN KEY (station_arrival_id) REFERENCES Station(id),
    CONSTRAINT ck_price_positive CHECK (price>=0),
    CONSTRAINT uq_segment_booking UNIQUE (run_id, seat_id, station_departure_id, station_arrival_id)
);

CREATE TABLE ReservedLeg(
    id BIGSERIAL PRIMARY KEY,
    booking_segment_id BIGINT NOT NULL,
    run_id BIGINT NOT NULL,
    seat_id BIGINT NOT NULL,
    station_id BIGINT NOT NULL,
    CONSTRAINT fk_leg_segment FOREIGN KEY (booking_segment_id) REFERENCES BookingSegment(id) ON DELETE CASCADE,
    CONSTRAINT fk_leg_run FOREIGN KEY (run_id) REFERENCES Run(id),
    CONSTRAINT fk_leg_seat FOREIGN KEY (seat_id) REFERENCES Seat(id),
    CONSTRAINT fk_leg_station FOREIGN KEY (station_id) REFERENCES Station(id),
    CONSTRAINT uq_run_seat_station UNIQUE (run_id, seat_id, station_id)
);