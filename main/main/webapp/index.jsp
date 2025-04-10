<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome | EventWizard</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #e0f7fa, #ffffff);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 40px 20px;
        }

        .hero-box {
            text-align: center;
            max-width: 800px;
            background: white;
            padding: 60px 40px;
            border-radius: 16px;
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.08);
        }

        .hero-box h1 {
            font-size: 2.5rem;
            margin-bottom: 20px;
            color: #2c3e50;
        }

        .hero-box p {
            font-size: 1.1rem;
            margin-bottom: 30px;
            color: #555;
        }

        .action-buttons {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }

        .action-buttons a {
            text-decoration: none;
            background-color: #007bff;
            color: white;
            padding: 14px 24px;
            border-radius: 8px;
            font-size: 1rem;
            transition: background-color 0.3s ease;
        }

        .action-buttons a:hover {
            background-color: #0056b3;
        }

        @media screen and (max-width: 600px) {
            .hero-box {
                padding: 40px 20px;
            }

            .hero-box h1 {
                font-size: 1.8rem;
            }

            .action-buttons a {
                width: 100%;
                text-align: center;
            }
        }
    </style>
</head>
<body>

<div class="hero-box">
    <h1>Welcome to EventWizard</h1>
    <p>Your one-stop platform to create, manage, and predict events with ease.</p>

    <div class="action-buttons">
        <a href="create.jsp">Add Event</a>
        <a href="view">View Events</a>
        <a href="search">Search</a>
        <a href="predict.jsp">Predict Type</a>
    </div>
</div>

</body>
</html>
