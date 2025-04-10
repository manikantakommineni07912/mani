<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Prediction Result</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f9fafb;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }

        .result-box {
            background: #ffffff;
            padding: 50px 40px;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 500px;
            width: 90%;
        }

        .result-box h1 {
            color: #444;
            font-size: 1.8rem;
            margin-bottom: 20px;
        }

        .result-badge {
            background-color: #17a2b8;
            color: #fff;
            display: inline-block;
            padding: 14px 28px;
            font-size: 1.4rem;
            font-weight: bold;
            border-radius: 40px;
            margin: 20px 0;
        }

        .action-links {
            margin-top: 30px;
        }

        .action-links a {
            display: inline-block;
            margin: 0 10px;
            padding: 12px 20px;
            text-decoration: none;
            font-size: 1rem;
            color: white;
            border-radius: 6px;
            transition: background-color 0.3s ease;
        }

        .btn-primary {
            background-color: #007bff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .btn-secondary {
            background-color: #6c757d;
        }

        .btn-secondary:hover {
            background-color: #545b62;
        }
    </style>
</head>
<body>

<div class="result-box">
    <h1>Predicted Event Type</h1>

    <div class="result-badge">
        ${prediction}
    </div>

    <div class="action-links">
        <a href="predict.jsp" class="btn-secondary">Try Again</a>
        <a href="index.jsp" class="btn-primary">Go to Dashboard</a>
    </div>
</div>

</body>
</html>
