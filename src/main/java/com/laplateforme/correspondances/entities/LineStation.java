package com.laplateforme.correspondances.entities;
import jakarta.persistence.*;
import org.hibernate.annotations.Check;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import org.springframework.data.annotation.Id;

import java.math.BigDecimal;

@Entity
@Table(name="LineStation",
        uniqueConstraints = {
        @UniqueConstraint(
                name = "uq_line_station",
                columnNames = {
                        "line_id, station_id"}
        ),
        @UniqueConstraint(
                name = "uq_line_stop_order",
                columnNames = {
                        "line_id, stop_order"}
        )}
)
@Check(constraints = "stop_order>0")
@Check(constraints = "distance_from_origin>=0")

public class LineStation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "line_id", nullable = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    private Line line;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="station_id", nullable = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    private Station station;

    @Column(name="stop_order", nullable = false)
    private Integer stopOrder;

    @Column(name="distance_from_origin", nullable = false, precision = 6, scale = 1)
    private BigDecimal distanceFromOrigin;

    protected LineStation(){}

    public LineStation(Line line, Station station, Integer stopOrder, BigDecimal distanceFromOrigin){
        this.line=line;
        this.station=station;
        this.stopOrder=stopOrder;
        this.distanceFromOrigin=distanceFromOrigin;
    }

    public Line getLine() {
        return line;
    }

    public void setLine(Line line) {
        this.line = line;
    }

    public Station getStation() {
        return station;
    }

    public void setStation(Station station) {
        this.station = station;
    }

    public Integer getStopOrder() {
        return stopOrder;
    }

    public void setStopOrder(Integer stopOrder) {
        this.stopOrder = stopOrder;
    }

    public BigDecimal getDistanceFromOrigin() {
        return distanceFromOrigin;
    }

    public void setDistanceFromOrigin(BigDecimal distanceFromOrigin) {
        this.distanceFromOrigin = distanceFromOrigin;
    }
}
