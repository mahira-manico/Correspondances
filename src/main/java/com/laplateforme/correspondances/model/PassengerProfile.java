package com.laplateforme.correspondances.model;

import jakarta.persistence.*;
import org.springframework.data.annotation.Id;

@Entity
@Table(name="passenger_profile")
public class PassengerProfile {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="passenger_profile_id")
    private Long passengerProfileId;

    @Column(name="code", length = 20, nullable = false, unique = true)
    private String code;

    @Column(name="label", length = 50, nullable = false)
    private String label;

    protected PassengerProfile(){}

    public PassengerProfile(String code, String label){
        this.code=code;
        this.label=label;
    }

    public Long getPassengerProfileId() {
        return passengerProfileId;
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
