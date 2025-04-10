package com.eventwizard.platform.model;

import java.util.Date;

/**
 * EventRecord - Data container class that represents an event entity.
 * Used for transferring and managing event data within the application.
 */
public class EventRecord {

    private int id;
    private String name;
    private Date date;
    private String location;
    private String description;
    private String category;
    private int attendeeCount;

    public EventRecord() {}

    public EventRecord(int id, String name, Date date, String location, String description, String category, int attendeeCount) {
        this.id = id;
        this.name = name;
        this.date = date;
        this.location = location;
        this.description = description;
        this.category = category;
        this.attendeeCount = attendeeCount;
    }

    public int getId() { return id; }

    public void setId(int id) { this.id = id; }

    public String getName() { return name; }

    public void setName(String name) { this.name = name; }

    public Date getDate() { return date; }

    public void setDate(Date date) { this.date = date; }

    public String getLocation() { return location; }

    public void setLocation(String location) { this.location = location; }

    public String getDescription() { return description; }

    public void setDescription(String description) { this.description = description; }

    public String getCategory() { return category; }

    public void setCategory(String category) { this.category = category; }

    public int getAttendeeCount() { return attendeeCount; }

    public void setAttendeeCount(int attendeeCount) { this.attendeeCount = attendeeCount; }
}
