package com.laplateforme.correspondances.entities;

import jakarta.persistence.*;
import org.springframework.data.annotation.Id;

@Entity
@Table(name="train")
public class Train {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name="train_number", length = 10, nullable = false, unique = true)
    private String train_number;

    protected Train(){}

    public Train(String train_number){
        this.train_number=train_number;
    }

    public String getTrain_number() {
        return train_number;
    }

    public void setTrain_number(String train_number) {
        this.train_number = train_number;
    }
}
