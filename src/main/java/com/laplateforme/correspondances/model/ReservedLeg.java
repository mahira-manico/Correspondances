package com.laplateforme.correspondances.model;

import jakarta.persistence.*;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

@Entity
@Table(name = "reserved_leg",
        uniqueConstraints = {
        @UniqueConstraint(
                name = "uq_run_seat_station",
                columnNames = {
                        "run_id", "seat_id", "station_id"})
})
public class ReservedLeg {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "reserved_leg_id")
    private Long reservedLegId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "booking_segment_id", nullable = false)
    private BookingSegment bookingSegment;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "run_id", nullable = false)
    private Run run;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "seat_id", nullable = false)
    private Seat seat;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "station_id", nullable = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    private Station station;

    protected ReservedLeg() {}

    public ReservedLeg(BookingSegment bookingSegment, Run run, Seat seat, Station station) {
        this.bookingSegment = bookingSegment;
        this.run = run;
        this.seat = seat;
        this.station = station;
    }

    public Long getReservedLegId() {
        return reservedLegId;
    }

    public BookingSegment getBookingSegment() {
        return bookingSegment;
    }

    public void setBookingSegment(BookingSegment bookingSegment) {
        this.bookingSegment = bookingSegment;
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

    public Station getStation() {
        return station;
    }
    public void setStation(Station station) {
        this.station = station;
    }
}