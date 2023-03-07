package com.example.ToDo.demo.domain;

import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.sql.Timestamp;

@NoArgsConstructor
@Entity
public class Lists {

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    private Long id;


    @Column
    private Long userinfo;


    @Column
    private String title;

    @Column
    private String content;


    @Column
    private Timestamp timestamp;

    @Column
    private Boolean updated;

    public Lists(Long id, Long userinfo, String title, String content, Timestamp timestamp, Boolean updated) {
        this.id = id;
        this.userinfo = userinfo;
        this.title = title;
        this.content = content;
        this.timestamp = timestamp;
        this.updated = updated;
    }

    public Lists(ListRequestDto listRequestDto) {
        this.userinfo = listRequestDto.getUserinfo();
        this.title = listRequestDto.getTitle();
        this.content = listRequestDto.getContent();
        this.timestamp = listRequestDto.getTimestamp();
        this.updated = listRequestDto.getUpdated();
    }


    public Long getId() {
        return id;
    }

    public Long getUserinfo() {
        return userinfo;
    }

    public String getTitle() {
        return title;
    }

    public void setUpdated(Boolean updated) {
        this.updated = updated;
    }

    public String getContent() {
        return content;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public Boolean getUpdated() {
        return updated;
    }
}
