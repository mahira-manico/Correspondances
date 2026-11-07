package com.laplateforme.correspondances.entities;

import jakarta.persistence.*;
import org.springframework.data.annotation.Id;

@Entity
@Table(name = "station")
public class Station {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "code", nullable = false, unique = true,length = 10)
    private String code;

    @Column(name="name",length = 100,nullable = false)
    private String name;

    @Column(name="city",length = 100,nullable = false)
    private String city;

    protected Station(){}

    public Station(String code, String name, String city){
        this.code=code;
        this.name=name;
        this.city=city;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }
}
