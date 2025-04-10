<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add New Event</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: "Helvetica Neue", sans-serif;
            background-color: #f0f2f5;
            display: flex;
            height: 100vh;
        }

        .sidebar {
            width: 35%;
            background: #003366;
            color: white;
            padding: 50px 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .sidebar h1 {
            font-size: 2rem;
            margin-bottom: 20px;
        }

        .sidebar p {
            font-size: 1rem;
            line-height: 1.6;
        }

        .form-section {
            flex: 1;
            background: white;
            padding: 60px 80px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .form-box {
            width: 100%;
            max-width: 600px;
        }

        h2 {
            margin-bottom: 30px;
            color: #222;
        }

        label {
            font-weight: 600;
            margin-top: 16px;
            display: block;
            margin-bottom: 8px;
            color: #333;
        }

        input, select, textarea {
            width: 100%;
            padding: 12px;
            font-size: 1rem;
            border-radius: 5px;
            border: 1px solid #ccc;
            transition: 0.2s ease;
        }

        input:focus, select:focus, textarea:focus {
            border-color: #0077cc;
            outline: none;
        }

        textarea {
            resize: none;
        }

        .btn-submit {
            background-color: #0077cc;
            color: white;
            padding: 12px;
            width: 100%;
            border: none;
            border-radius: 6px;
            font-size: 1rem;
            margin-top: 25px;
            cursor: pointer;
        }

        .btn-submit:hover {
            background-color: #005fa3;
        }

        @media screen and (max-width: 900px) {
            body {
                flex-direction: column;
            }

            .sidebar {
                width: 100%;
                text-align: center;
                padding: 40px 20px;
            }

            .form-section {
                padding: 40px 20px;
            }
        }
    </style>
</head>
<body>

<div class="sidebar">
    <h1>EventWizard</h1>
    <p>Welcome to the event creation panel. Please fill in the details of your event and submit. Fields marked with * are required.</p>
</div>

<div class="form-section">
    <div class="form-box">
        <h2>Create Event</h2>
        <form action="create" method="post">

            <label for="title">Event Name *</label>
            <input type="text" id="title" name="title" required placeholder="e.g. Dev Conference 2025">

            <label for="schedule">Event Date *</label>
            <input type="date" id="schedule" name="schedule" required>

            <label for="venue">Location *</label>
            <input type="text" id="venue" name="venue" required placeholder="City or platform (e.g. Zoom)">

            <label for="summary">Description *</label>
            <textarea id="summary" name="summary" rows="4" required placeholder="Brief event overview"></textarea>

            <label for="type">Type *</label>
            <select id="type" name="type" required>
                <option value="">-- Choose Type --</option>
                <option value="Webinar">Webinar</option>
                <option value="Workshop">Workshop</option>
                <option value="Meetup">Meetup</option>
            </select>

            <button type="submit" class="btn-submit">Submit Event</button>
        </form>
    </div>
</div>

</body>
</html>
