package com.laplateforme.correspondances.model;

import jakarta.persistence.*;
import org.hibernate.annotations.Check;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import java.math.BigDecimal;
import java.time.OffsetDateTime;

@Entity
@Table(name="booking")
@Check(constraints = "total_price>=0")

public class Booking {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="station_id")
    private Long StationId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="passenger_id", nullable = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    private Passenger passenger;

    @Column(name="booked_at", nullable = false)
    private OffsetDateTime bookedAt;

    @Column(name="total_price", nullable = false, precision = 10, scale = 2)
    private BigDecimal totalPrice;

    protected Booking(){}

    public Booking(Passenger passenger, OffsetDateTime bookedAt, BigDecimal totalPrice){
        this.passenger=passenger;
        this.bookedAt=bookedAt;
        this.totalPrice=totalPrice;
    }

    public Long getStationId() {
        return StationId;
    }

    public Passenger getPassenger() {
        return passenger;
    }

    public void setPassenger(Passenger passenger) {
        this.passenger = passenger;
    }

    public OffsetDateTime getBookedAt() {
        return bookedAt;
    }

    public void setBookedAt(OffsetDateTime bookedAt) {
        this.bookedAt = bookedAt;
    }

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }
}
