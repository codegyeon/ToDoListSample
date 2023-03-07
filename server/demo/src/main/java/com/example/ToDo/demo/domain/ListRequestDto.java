package com.example.ToDo.demo.domain;


import java.sql.Timestamp;

public class ListRequestDto {

    private Long userinfo;
    private String title;
    private String content;
    private Timestamp timestamp;
    private Boolean updated;

    public Long getUserinfo() {
        return userinfo;
    }

    public void setUserinfo(Long userinfo) {
        this.userinfo = userinfo;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }

    public Boolean getUpdated() {
        return updated;
    }

    public void setUpdated(Boolean updated) {
        this.updated = updated;
    }
}
