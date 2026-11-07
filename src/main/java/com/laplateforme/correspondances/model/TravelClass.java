package com.laplateforme.correspondances.model;

import jakarta.persistence.*;
import org.springframework.data.annotation.Id;

@Entity
@Table(name="travel_class")
public class TravelClass {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name="code", length = 10, nullable = false, unique = true)
    private String code;

    @Column(name="label", length = 50, nullable = false)
    private String label;

    protected TravelClass(){}

    public TravelClass(String code, String label){
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
