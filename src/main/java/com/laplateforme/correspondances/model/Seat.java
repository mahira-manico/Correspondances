package com.laplateforme.correspondances.model;

import jakarta.persistence.*;
import org.hibernate.annotations.Check;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

@Entity
@Table(name="seat", uniqueConstraints = {
        @UniqueConstraint(
                name = "uq_carriage_seat",
                columnNames = {
                        "carriage_id", "seat_number"}
        )})
@Check(constraints = "seat_number>0")
public class Seat {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="seat_id")
    private Integer seatId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "carriage_id", nullable = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    private Carriage carriage;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="travel_class_id", nullable = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    private TravelClass travelClass;

    @Column(name = "seat_number", nullable = false)
    private Short seatNumber;

    protected Seat(){}

    public Seat(Carriage carriage, TravelClass travelClass, Short seatNumber){
        this.carriage=carriage;
        this.travelClass=travelClass;
        this.seatNumber=seatNumber;
    }

    public Integer getSeatId() {
        return seatId;
    }

    public Carriage getCarriage() {
        return carriage;
    }

    public void setCarriage(Carriage carriage) {
        this.carriage = carriage;
    }

    public TravelClass getTravelClass() {
        return travelClass;
    }

    public void setTravelClass(TravelClass travelClass) {
        this.travelClass = travelClass;
    }

    public Short getSeatNumber() {
        return seatNumber;
    }

    public void setSeatNumber(Short seatNumber) {
        this.seatNumber = seatNumber;
    }
}
