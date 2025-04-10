<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.eventwizard.platform.core.EventRecord" %>
<jsp:useBean id="eventDetails" type="com.eventwizard.platform.core.EventRecord" scope="request" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Event | EventWizard</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: #f2f2f2;
        }

        .header {
            background-color: #222;
            color: white;
            padding: 20px;
            text-align: center;
            font-size: 1.8rem;
        }

        .form-container {
            max-width: 700px;
            background: #ffffff;
            margin: 40px auto;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        }

        .form-title {
            font-size: 1.5rem;
            margin-bottom: 30px;
            color: #333;
            text-align: left;
            border-bottom: 2px solid #eee;
            padding-bottom: 10px;
        }

        label {
            font-weight: bold;
            margin-top: 18px;
            display: block;
            color: #444;
        }

        input, select, textarea {
            width: 100%;
            padding: 12px;
            font-size: 1rem;
            margin-top: 8px;
            border-radius: 6px;
            border: 1px solid #ccc;
            transition: border 0.3s ease;
        }

        input:focus, select:focus, textarea:focus {
            border-color: #0077cc;
            outline: none;
        }

        .submit-btn {
            margin-top: 30px;
            width: 100%;
            background-color: #28a745;
            color: white;
            padding: 14px;
            font-size: 1rem;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        .submit-btn:hover {
            background-color: #218838;
        }

        .back-link {
            text-align: center;
            display: block;
            margin-top: 20px;
            text-decoration: none;
            color: #666;
        }

        .back-link:hover {
            text-decoration: underline;
        }

        @media screen and (max-width: 600px) {
            .form-container {
                padding: 25px;
                margin: 20px;
            }
        }
    </style>
</head>
<body>

<div class="header">
    Modify Event Details
</div>

<div class="form-container">
    <div class="form-title">Edit Your Event</div>
    <form action="update" method="post">
        <input type="hidden" name="uid" value="${eventDetails.id}" />

        <label for="title">Event Title</label>
        <input type="text" id="title" name="title" value="${eventDetails.name}" required />

        <label for="schedule">Scheduled Date</label>
        <input type="date" id="schedule" name="schedule" value="${eventDetails.date}" required />

        <label for="venue">Location</label>
        <input type="text" id="venue" name="venue" value="${eventDetails.location}" required />

        <label for="summary">Event Description</label>
        <textarea id="summary" name="summary" rows="4" required>${eventDetails.description}</textarea>

        <label for="type">Event Type</label>
        <select id="type" name="type" required>
            <option value="">-- Choose Type --</option>
            <option value="Webinar" ${eventDetails.category == 'Webinar' ? 'selected' : ''}>Webinar</option>
            <option value="Workshop" ${eventDetails.category == 'Workshop' ? 'selected' : ''}>Workshop</option>
            <option value="Meetup" ${eventDetails.category == 'Meetup' ? 'selected' : ''}>Meetup</option>
        </select>

        <button type="submit" class="submit-btn">Update Event</button>
        <a href="view" class="back-link">← Cancel and return to list</a>
    </form>
</div>

</body>
</html>
