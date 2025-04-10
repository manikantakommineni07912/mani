<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Event Type Prediction</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #f1f5f8;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .prediction-card {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 14px;
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            width: 90%;
        }

        .prediction-card h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }

        label {
            font-weight: 600;
            margin-bottom: 6px;
            display: block;
            color: #555;
        }

        input, textarea {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 1rem;
            transition: 0.3s ease;
        }

        input:focus, textarea:focus {
            border-color: #007bff;
            outline: none;
        }

        textarea {
            resize: vertical;
        }

        .btn-predict {
            width: 100%;
            padding: 14px;
            background-color: #007bff;
            border: none;
            border-radius: 6px;
            font-size: 1rem;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-predict:hover {
            background-color: #0056b3;
        }

        .back-link {
            text-align: center;
            margin-top: 20px;
            display: block;
            color: #666;
            text-decoration: none;
        }

        .back-link:hover {
            text-decoration: underline;
        }

        @media screen and (max-width: 600px) {
            .prediction-card {
                padding: 25px;
            }
        }
    </style>
</head>
<body>

<div class="prediction-card">
    <h2>Predict Event Type</h2>
    <form action="predict" method="post">
        <label for="venue">Event Location</label>
        <input type="text" id="venue" name="venue" required placeholder="e.g. London, Online, etc.">

        <label for="schedule">Date of Event</label>
        <input type="date" id="schedule" name="schedule" required>

        <label for="summary">Event Summary</label>
        <textarea id="summary" name="summary" rows="4" required placeholder="Brief event description here..."></textarea>

        <button type="submit" class="btn-predict">Run Prediction</button>
        <a href="index.jsp" class="back-link">← Back to Dashboard</a>
    </form>
</div>

</body>
</html>
