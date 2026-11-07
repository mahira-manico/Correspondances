package com.laplateforme.correspondances.model;

import jakarta.persistence.*;
import org.hibernate.annotations.Check;
import org.springframework.data.annotation.Id;

import java.time.LocalDate;

@Entity
@Table(name="calendar")
@Check(constraints = "valid_from<=valid_to")
public class Calendar {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "calendar_id")
    private Long calendarId;

    @Column(name="code", length = 20, nullable = false, unique = true)
    private String code;

    @Column(name="label", length = 100, nullable = false)
    private String label;

    @Column(name="monday", nullable = false)
    private boolean monday;

    @Column(name="tuesday", nullable = false)
    private boolean tuesday;

    @Column(name="wednesday", nullable = false)
    private boolean wednesday;

    @Column(name="thursday", nullable = false)
    private boolean thursday;

    @Column(name="friday", nullable = false)
    private boolean friday;

    @Column(name="saturday", nullable = false)
    private boolean saturday;

    @Column(name="sunday", nullable = false)
    private boolean sunday;

    @Column(name="valid_from", nullable = false)
    private LocalDate validFrom;

    @Column(name="valid_to", nullable = false)
    private LocalDate validTo;

    protected Calendar(){}

    public Calendar(String code, String label, boolean monday, boolean tuesday, boolean wednesday, boolean thursday, boolean friday, boolean saturday, boolean sunday, LocalDate validFrom, LocalDate validTo){
        this.code=code;
        this.label=label;
        this.monday=monday;
        this.tuesday=tuesday;
        this.wednesday=wednesday;
        this.thursday=thursday;
        this.friday=friday;
        this.saturday=saturday;
        this.sunday=sunday;
        this.validFrom=validFrom;
        this.validTo=validTo;
    }

    public Long getCalendarId() {
        return calendarId;
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

    public boolean isMonday() {
        return monday;
    }

    public void setMonday(boolean monday) {
        this.monday = monday;
    }

    public boolean isTuesday() {
        return tuesday;
    }

    public void setTuesday(boolean tuesday) {
        this.tuesday = tuesday;
    }

    public boolean isWednesday() {
        return wednesday;
    }

    public void setWednesday(boolean wednesday) {
        this.wednesday = wednesday;
    }

    public boolean isThursday() {
        return thursday;
    }

    public void setThursday(boolean thursday) {
        this.thursday = thursday;
    }

    public boolean isFriday() {
        return friday;
    }

    public void setFriday(boolean friday) {
        this.friday = friday;
    }

    public boolean isSaturday() {
        return saturday;
    }

    public void setSaturday(boolean saturday) {
        this.saturday = saturday;
    }

    public boolean isSunday() {
        return sunday;
    }

    public void setSunday(boolean sunday) {
        this.sunday = sunday;
    }

    public LocalDate getValidFrom() {
        return validFrom;
    }

    public void setValidFrom(LocalDate validFrom) {
        this.validFrom = validFrom;
    }

    public LocalDate getValidTo() {
        return validTo;
    }

    public void setValidTo(LocalDate validTo) {
        this.validTo = validTo;
    }
}
