package com.laplateforme.correspondances.model;

import jakarta.persistence.*;
@Entity
@Table(name="fare_period")
public class FarePeriod {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="fare_period_id")
    private Short farePeriodId;

    @Column(name="code", length = 20, nullable = false, unique = true)
    private String code;

    @Column(name="label", length = 50, nullable = false)
    private String label;

    protected FarePeriod(){}

    public FarePeriod(String code, String label){
        this.code=code;
        this.label=label;
    }

    public Short getFarePeriodId() {
        return farePeriodId;
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
