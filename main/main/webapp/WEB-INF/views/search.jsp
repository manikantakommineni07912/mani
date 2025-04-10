<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Search Events</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .search-panel {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            width: 90%;
            max-width: 800px;
        }

        h2 {
            margin-bottom: 30px;
            text-align: center;
            color: #333;
        }

        form {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: space-between;
        }

        .form-group {
            flex: 1 1 30%;
            display: flex;
            flex-direction: column;
        }

        label {
            margin-bottom: 6px;
            font-weight: 600;
            color: #444;
        }

        input, select {
            padding: 12px;
            font-size: 1rem;
            border: 1px solid #ccc;
            border-radius: 6px;
            transition: border-color 0.3s ease;
        }

        input:focus, select:focus {
            border-color: #007bff;
            outline: none;
        }

        .search-btn {
            width: 100%;
            padding: 14px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 1rem;
            cursor: pointer;
            margin-top: 20px;
        }

        .search-btn:hover {
            background-color: #0056b3;
        }

        @media screen and (max-width: 768px) {
            .form-group {
                flex: 1 1 100%;
            }
        }
    </style>
</head>
<body>

<div class="search-panel">
    <h2>Search Events</h2>
    <form action="search" method="get">
        <div class="form-group">
            <label for="venue">Location</label>
            <input type="text" id="venue" name="venue" placeholder="Enter venue" />
        </div>

        <div class="form-group">
            <label for="schedule">Date</label>
            <input type="date" id="schedule" name="schedule" />
        </div>

        <div class="form-group">
            <label for="type">Type</label>
            <select id="type" name="type">
                <option value="">-- Choose --</option>
                <option value="Webinar">Webinar</option>
                <option value="Workshop">Workshop</option>
                <option value="Meetup">Meetup</option>
            </select>
        </div>

        <button type="submit" class="search-btn">Search Now</button>
    </form>
</div>

</body>
</html>
