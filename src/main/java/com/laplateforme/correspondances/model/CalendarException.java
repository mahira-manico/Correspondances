package com.laplateforme.correspondances.model;

import jakarta.persistence.*;
import org.hibernate.annotations.Check;
import org.springframework.data.annotation.Id;

import java.time.LocalDate;

@Entity
@Table(
        name="calendar_exception",
        uniqueConstraints = {
                @UniqueConstraint(
                        name = "uq_exception_calendar_date",
                        columnNames = {
                                "calendar_id, exception_date"}
                        )
        })
@Check(constraints = "exception_type IN ('ADDED', 'REMOVED')")
public class CalendarException {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "calendar_id", nullable = false)
    private Calendar calendar;

    @Column(name="exception_date", nullable = false)
    private LocalDate exceptionDate;

    @Enumerated(EnumType.STRING)
    @Column(name="exception_type", length = 7, nullable = false)
    private Exception exceptionType;


}
