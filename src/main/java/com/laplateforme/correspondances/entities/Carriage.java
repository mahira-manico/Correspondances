package com.laplateforme.correspondances.entities;

import jakarta.persistence.*;
import org.hibernate.annotations.Check;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import org.springframework.data.annotation.Id;

@Entity
@Table(name="carriage",
        uniqueConstraints = {
        @UniqueConstraint(
                name = "uq_train_carriage",
                columnNames = {
                "train_id, carriage_number"}
        )})
@Check(constraints = "carriage_number>0")
public class Carriage {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "train_id", nullable = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    private Train train;

    @Column(name="carriage_number", nullable = false)
    private Integer carriageNumber;

    protected Carriage(){}

    public Carriage(Train train, Integer carriageNumber){
        this.train=train;
        this.carriageNumber=carriageNumber;
    }

    public Train getTrain() {
        return train;
    }

    public void setTrain(Train train) {
        this.train = train;
    }

    public Integer getCarriageNumber() {
        return carriageNumber;
    }

    public void setCarriageNumber(Integer carriageNumber) {
        this.carriageNumber = carriageNumber;
    }
}
