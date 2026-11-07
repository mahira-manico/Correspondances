package com.laplateforme.correspondances.model;

import jakarta.persistence.*;
import org.hibernate.annotations.Check;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import org.springframework.data.annotation.Id;

@Entity
@Table(name="seat", uniqueConstraints = {
        @UniqueConstraint(
                name = "uq_train_carriage",
                columnNames = {
                        "train_id, carriage_number"}
        )})
@Check(constraints = "carriage_number>0")
public class Seat {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "carriage_id", nullable = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    private Carriage carriage;

    @ManyToOne
    @JoinColumn(name="travel_class_id", nullable = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    private TravelClass travelClass;

    @Column(name = "seat_number", nullable = false)
    private Integer seatNumber;

    protected Seat(){}

    public Seat(Carriage carriage, TravelClass travelClass, Integer seatNumber){
        this.carriage=carriage;
        this.travelClass=travelClass;
        this.seatNumber=seatNumber;
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

    public Integer getSeatNumber() {
        return seatNumber;
    }

    public void setSeatNumber(Integer seatNumber) {
        this.seatNumber = seatNumber;
    }
}
