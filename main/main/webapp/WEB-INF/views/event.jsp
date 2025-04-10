<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.eventwizard.platform.model.EventRecord" %>
<jsp:useBean id="events" type="java.util.List" scope="request" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>All Events | EventWizard</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: #f7f9fb;
            padding: 40px;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }

        .event-table {
            width: 100%;
            max-width: 1000px;
            margin: auto;
            border-collapse: collapse;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.08);
            background-color: white;
            border-radius: 10px;
            overflow: hidden;
        }

        .event-table th, .event-table td {
            padding: 16px;
            text-align: left;
            border-bottom: 1px solid #eee;
        }

        .event-table th {
            background-color: #007bff;
            color: white;
        }

        .event-table tr:hover {
            background-color: #f0f8ff;
        }

        .actions a {
            margin-right: 10px;
            color: #007bff;
            text-decoration: none;
            font-weight: 500;
        }

        .actions a:hover {
            text-decoration: underline;
        }

        .empty-message {
            text-align: center;
            margin-top: 40px;
            font-size: 1.1rem;
            color: #777;
        }

        @media screen and (max-width: 768px) {
            .event-table th, .event-table td {
                padding: 10px;
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>

<h2>Upcoming Events</h2>

<%
    List<EventRecord> eventList = (List<EventRecord>) request.getAttribute("events");
    if (eventList != null && !eventList.isEmpty()) {
%>
<table class="event-table">
    <thead>
    <tr>
        <th>Title</th>
        <th>Date</th>
        <th>Venue</th>
        <th>Type</th>
        <th>Attendees</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <% for (EventRecord event : eventList) { %>
    <tr>
        <td><%= event.getName() %></td>
        <td><%= event.getDate() %></td>
        <td><%= event.getLocation() %></td>
        <td><%= event.getCategory() %></td>
        <td><%= event.getAttendeeCount() %></td>
        <td class="actions">
            <a href="edit.jsp?uid=<%= event.getId() %>">Edit</a>
            <a href="delete?uid=<%= event.getId() %>">Delete</a>
            <a href="rsvp?uid=<%= event.getId() %>">RSVP</a>
        </td>
    </tr>
    <% } %>
    </tbody>
</table>
<%
} else {
%>
<div class="empty-message"> No events found. Try creating one!</div>
<%
    }
%>

</body>
</html>
