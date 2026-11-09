package com.laplateforme.correspondances.model;

import jakarta.persistence.*;
import org.hibernate.annotations.Check;
import java.time.LocalDate;

@Entity
@Table(
        name="calendar_exception",
        uniqueConstraints = {
                @UniqueConstraint(
                        name = "uq_exception_calendar_date",
                        columnNames = {
                                "calendar_id", "exception_date"}
                        )
        })
@Check(constraints = "exception_type IN ('ADDED', 'REMOVED')")
public class CalendarException {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="exception_id")
    private Integer exceptionId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "calendar_id", nullable = false)
    private Calendar calendar;

    @Column(name="exception_date", nullable = false)
    private LocalDate exceptionDate;

    @Enumerated(EnumType.STRING)
    @Column(name="exception_type", length = 7, nullable = false)
    private ExceptionType exceptionType;

    protected CalendarException(){}

    public CalendarException(Calendar calendar, LocalDate exceptionDate, ExceptionType exceptionType) {
        this.calendar = calendar;
        this.exceptionDate = exceptionDate;
        this.exceptionType = exceptionType;
    }

    public Integer getExceptionId() {
        return exceptionId;
    }

    public Calendar getCalendar() {
        return calendar;
    }

    public void setCalendar(Calendar calendar) {
        this.calendar = calendar;
    }

    public ExceptionType getExceptionType() {
        return exceptionType;
    }

    public void setExceptionType(ExceptionType exceptionType) {
        this.exceptionType = exceptionType;
    }

    public LocalDate getExceptionDate() {
        return exceptionDate;
    }

    public void setExceptionDate(LocalDate exceptionDate) {
        this.exceptionDate = exceptionDate;
    }
}
