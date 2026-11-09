package com.laplateforme.correspondances.model;

import jakarta.persistence.*;
import org.hibernate.annotations.Check;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import java.math.BigDecimal;

@Entity
@Table(name = "fare", uniqueConstraints = {
        @UniqueConstraint(
                name = "uq_fare_dimensions",
                columnNames = {
                        "travel_class_id", "fare_period_id", "passenger_profile_id"
                })
})
@Check(constraints = "base_price>=0")
@Check(constraints = "price_per_km>=0")
public class Fare {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "fare_id")
    private Integer fareId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "travel_class_id", nullable = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    private TravelClass travelClass;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "fare_period_id", nullable = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    private FarePeriod farePeriod;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "passenger_profile_id", nullable = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    private PassengerProfile passengerProfile;

    @Column(name = "base_price", nullable = false, precision = 8, scale = 2)
    private BigDecimal basePrice;

    @Column(name = "price_per_km", nullable = false, precision = 6, scale = 4)
    private BigDecimal pricePerKm;

    protected Fare() {}

    public Fare(TravelClass travelClass, FarePeriod farePeriod, PassengerProfile passengerProfile,
                BigDecimal basePrice, BigDecimal pricePerKm) {
        this.travelClass = travelClass;
        this.farePeriod = farePeriod;
        this.passengerProfile = passengerProfile;
        this.basePrice = basePrice;
        this.pricePerKm = pricePerKm;
    }

    public Integer getFareId() {
        return fareId;
    }

    public TravelClass getTravelClass() {
        return travelClass;
    }

    public void setTravelClass(TravelClass travelClass) {
        this.travelClass = travelClass;
    }

    public FarePeriod getFarePeriod() {
        return farePeriod;
    }

    public void setFarePeriod(FarePeriod farePeriod) {
        this.farePeriod = farePeriod;
    }

    public PassengerProfile getPassengerProfile() {
        return passengerProfile;
    }

    public void setPassengerProfile(PassengerProfile passengerProfile) {
        this.passengerProfile = passengerProfile;
    }

    public BigDecimal getBasePrice() {
        return basePrice;
    }

    public void setBasePrice(BigDecimal basePrice) {
        this.basePrice = basePrice;
    }

    public BigDecimal getPricePerKm() {
        return pricePerKm;
    }
    public void setPricePerKm(BigDecimal pricePerKm) {
        this.pricePerKm = pricePerKm;
    }
}