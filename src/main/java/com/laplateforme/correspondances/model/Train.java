package com.laplateforme.correspondances.model;

import jakarta.persistence.*;

@Entity
@Table(name="train")
public class Train {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="train_id")
    private Integer trainId;

    @Column(name="train_number", length = 10, nullable = false, unique = true)
    private String trainNumber;

    protected Train(){}

    public Train(String trainNumber){
        this.trainNumber=trainNumber;
    }

    public Integer getTrainId() {
        return trainId;
    }

    public String getTrainNumber() {
        return trainNumber;
    }

    public void setTrainNumber(String trainNumber) {
        this.trainNumber = trainNumber;
    }
}
