package com.laplateforme.correspondances.entities;

import jakarta.persistence.*;
import org.springframework.data.annotation.Id;

import java.util.Date;

@Entity
@Table(name="passenger")
public class Passenger {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name="last_name", length = 100, nullable = false)
    private String lastName;

    @Column(name="first_name", length = 100, nullable = false)
    private String firstName;

    @Column(name="email", length = 255, nullable = false)
    private String email;

    @Column(name="birth_date")
    private Date birthDate;

    protected Passenger(){}

    public Passenger(String lastName, String firstName, String email, Date birthDate){
        this.lastName=lastName;
        this.firstName=firstName;
        this.email=email;
        this.birthDate=birthDate;
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

    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }
}
