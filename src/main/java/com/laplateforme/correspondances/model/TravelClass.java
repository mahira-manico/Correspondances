package com.laplateforme.correspondances.model;

import jakarta.persistence.*;

@Entity
@Table(name="travel_class")
public class TravelClass {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="travel_class_id")
    private Long travelClassId;

    @Column(name="code", length = 10, nullable = false, unique = true)
    private String code;

    @Column(name="label", length = 50, nullable = false)
    private String label;

    protected TravelClass(){}

    public TravelClass(String code, String label){
        this.code=code;
        this.label=label;
    }

    public Long getTravelClassId() {
        return travelClassId;
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
