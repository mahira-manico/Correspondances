package com.laplateforme.correspondances.model;

import jakarta.persistence.*;
import org.hibernate.annotations.Check;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import org.springframework.data.annotation.Id;

import java.time.LocalTime;

@Entity
@Table(name="stop_time", uniqueConstraints = {
        @UniqueConstraint(
                name = "uq_trip_station",
                columnNames = {
                        "trip_id", "station_id"}),
        @UniqueConstraint(
                name = "uq_trip_sequence",
                columnNames = {
                        "trip_id","stop_sequence"})
})
@Check(constraints = "stop_sequence>0")
@Check(constraints = "arrival_time<=departure_time")
public class StopTime {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="stop_time_id")
    private Long stopTimeId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "trip_id", nullable = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    private TrainTrip trainTrip;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="station_id", nullable = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    private Station station;

    @Column(name = "stop_sequence", nullable = false)
    private Integer stopSequence;

    @Column(name="arrival_time", nullable = false)
    private LocalTime arrivalTime;

    @Column(name="departure_time", nullable = false)
    private LocalTime departureTime;

    protected StopTime(){}

    public StopTime(TrainTrip trainTrip, Station station, Integer stopSequence, LocalTime arrivalTime, LocalTime departureTime){
        this.trainTrip=trainTrip;
        this.station=station;
        this.stopSequence=stopSequence;
        this.arrivalTime=arrivalTime;
        this.departureTime=departureTime;
    }

    public Long getStopTimeId() {
        return stopTimeId;
    }

    public TrainTrip getTrainTrip() {
        return trainTrip;
    }

    public void setTrainTrip(TrainTrip trainTrip) {
        this.trainTrip = trainTrip;
    }

    public Station getStation() {
        return station;
    }

    public void setStation(Station station) {
        this.station = station;
    }

    public Integer getStopSequence() {
        return stopSequence;
    }

    public void setStopSequence(Integer stopSequence) {
        this.stopSequence = stopSequence;
    }

    public LocalTime getArrivalTime() {
        return arrivalTime;
    }

    public void setArrivalTime(LocalTime arrivalTime) {
        this.arrivalTime = arrivalTime;
    }

    public LocalTime getDepartureTime() {
        return departureTime;
    }

    public void setDepartureTime(LocalTime departureTime) {
        this.departureTime = departureTime;
    }
}
