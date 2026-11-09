package com.laplateforme.correspondances.model;

import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name="passenger")
public class Passenger {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="passenger_id")
    private Long passengerId;

    @Column(name="last_name", length = 100, nullable = false)
    private String lastName;

    @Column(name="first_name", length = 100, nullable = false)
    private String firstName;

    @Column(name="email", length = 255, nullable = false)
    private String email;

    @Column(name="birth_date")
    private LocalDate birthDate;

    protected Passenger(){}

    public Passenger(String lastName, String firstName, String email, LocalDate birthDate){
        this.lastName=lastName;
        this.firstName=firstName;
        this.email=email;
        this.birthDate=birthDate;
    }

    public Long getPassengerId() {
        return passengerId;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public LocalDate getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(LocalDate birthDate) {
        this.birthDate = birthDate;
    }
}
