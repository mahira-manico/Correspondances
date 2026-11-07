package com.laplateforme.correspondances.model;

import jakarta.persistence.*;
import org.hibernate.annotations.Check;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import org.springframework.data.annotation.Id;

import java.math.BigDecimal;

@Entity
@Table(name = "booking_segment", uniqueConstraints = {
        @UniqueConstraint(
                name = "uq_segment_run_seat",
                columnNames = {
                        "booking_segment_id, run_id, seat_id"})
})
@Check(constraints = "price>=0")
@Check(constraints = "departure_station_id<>arrival_station_id")
public class BookingSegment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "booking_id", nullable = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    private Booking booking;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "run_id", nullable = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    private Run run;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="seat_id", nullable = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    private Seat seat;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="fare_id", nullable = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    private Fare fare;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "departure_station_id", nullable = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    private Station departureStation;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "arrival_station_id", nullable = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    private Station arrivalStation;

    @Column(name = "price", nullable = false, precision = 8, scale = 2)
    private BigDecimal price;

    protected BookingSegment() {}

    public Booking getBooking() {
        return booking;
    }

    public void setBooking(Booking booking) {
        this.booking = booking;
    }

    public Run getRun() {
        return run;
    }

    public void setRun(Run run) {
        this.run = run;
    }

    public Seat getSeat() {
        return seat;
    }

    public void setSeat(Seat seat) {
        this.seat = seat;
    }

    public Fare getFare() {
        return fare;
    }

    public void setFare(Fare fare) {
        this.fare = fare;
    }

    public Station getDepartureStation() {
        return departureStation;
    }

    public void setDepartureStation(Station departureStation) {
        this.departureStation = departureStation;
    }

    public Station getArrivalStation() {
        return arrivalStation;
    }

    public void setArrivalStation(Station arrivalStation) {
        this.arrivalStation = arrivalStation;
    }
}