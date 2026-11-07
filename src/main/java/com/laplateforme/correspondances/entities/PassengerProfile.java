package com.laplateforme.correspondances.entities;

import jakarta.persistence.*;
import org.springframework.data.annotation.Id;

@Entity
@Table(name="passenger_profile")
public class PassengerProfile {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name="code", length = 20, nullable = false, unique = true)
    private String code;

    @Column(name="label", length = 50, nullable = false)
    private String label;

    protected PassengerProfile(){}

    public PassengerProfile(String code, String label){
        this.code=code;
        this.label=label;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }
}
