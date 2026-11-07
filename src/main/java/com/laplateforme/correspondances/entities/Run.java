package com.laplateforme.correspondances.entities;

import jakarta.persistence.*;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import org.springframework.data.annotation.Id;

import java.time.LocalDate;

@Entity
@Table(name="run", uniqueConstraints = {
        @UniqueConstraint(
                name = "uq_trip_run_date",
                columnNames = {
                        "trip_id, run_date"}
        )})
public class Run {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "trip_id", nullable = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    private TrainTrip trainTrip;

    @Column(name = "run_date", nullable = false)
    private LocalDate runDate;

    protected Run() {}

    public Run(TrainTrip trainTrip, LocalDate runDate){
        this.trainTrip=trainTrip;
        this.runDate=runDate;
    }

    public TrainTrip getTrainTrip() {
        return trainTrip;
    }

    public void setTrainTrip(TrainTrip trainTrip) {
        this.trainTrip = trainTrip;
    }

    public LocalDate getRunDate() {
        return runDate;
    }

    public void setRunDate(LocalDate runDate) {
        this.runDate = runDate;
    }
}