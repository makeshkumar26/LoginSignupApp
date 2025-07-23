<!DOCTYPE html>
<html>
<head>
    <title>Welcome</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: url("https://img.pikbest.com/wp/202344/high-tech-texture-futuristic-circuit-board-abstract-background-with-technological_9925654.jpg!sw800") no-repeat center center fixed;
            background-size: cover;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
        }

        .welcome-box {
            background-color: rgba(0, 0, 0, 0.6);
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0 0 20px rgba(0, 255, 255, 0.4);
            text-align: center;
            width: 400px;
        }

        .welcome-box h2 {
            font-size: 24px;
            margin-bottom: 15px;
        }

        .welcome-box a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #00bcd4;
            color: white;
            text-decoration: none;
            border-radius: 6px;
        }

        .welcome-box a:hover {
            background-color: #0097a7;
        }
    </style>
</head>
<body>
    <div class="welcome-box">
        <h2>Welcome, you are logged in!</h2>
        <a href="Home.jsp">Home</a>
    </div>
</body>
</html>
