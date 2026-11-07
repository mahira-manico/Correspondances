package com.laplateforme.correspondances.model;

import jakarta.persistence.*;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import org.springframework.data.annotation.Id;

@Entity
@Table(name = "train_trip")
public class TrainTrip {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name="trip_number", nullable = false, unique = true, length = 10)
    private String tripNumber;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "line_id", nullable = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    private Line line;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="calendar_id", nullable = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    private Calendar calendar;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="train_id", nullable = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    private Train train;

    protected TrainTrip(){}

    public TrainTrip(String tripNumber, Line line, Calendar calendar, Train train){
        this.tripNumber=tripNumber;
        this.line=line;
        this.calendar=calendar;
        this.train=train;
    }

    public String getTripNumber() {
        return tripNumber;
    }

    public void setTripNumber(String tripNumber) {
        this.tripNumber = tripNumber;
    }

    public Line getLine() {
        return line;
    }

    public void setLine(Line line) {
        this.line = line;
    }

    public Calendar getCalendar() {
        return calendar;
    }

    public void setCalendar(Calendar calendar) {
        this.calendar = calendar;
    }

    public Train getTrain() {
        return train;
    }

    public void setTrain(Train train) {
        this.train = train;
    }
}
