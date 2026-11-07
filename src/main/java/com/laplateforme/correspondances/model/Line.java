package com.laplateforme.correspondances.model;


import jakarta.persistence.*;
import org.springframework.data.annotation.Id;

@Entity
@Table(name = "line")
public class Line {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "line_id")
    private Long lineId;

    @Column(name="code", nullable = false, unique = true, length = 10)
    private String code;

    @Column(name="name", nullable = false, length = 100)
    private String name;

    protected Line(){}

    public Line(String code, String name){
        this.code=code;
        this.name=name;
    }

    public Long getLineId() {
        return lineId;
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
}
