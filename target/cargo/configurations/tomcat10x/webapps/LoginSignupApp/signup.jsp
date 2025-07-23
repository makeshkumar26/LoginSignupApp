<!DOCTYPE html>
<html>
<head>
    <title>Signup</title>
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
        }

        .signup-box {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0 0 20px rgba(0, 255, 255, 0.4);
            text-align: center;
            width: 320px;
            color: white;
        }

        .signup-box h2 {
            margin-bottom: 25px;
        }

        .signup-box input[type="text"],
        .signup-box input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: none;
            border-radius: 5px;
            font-size: 14px;
        }

        .signup-box button {
            width: 100%;
            padding: 10px;
            background-color: #00bcd4;
            border: none;
            color: white;
            font-size: 16px;
            border-radius: 5px;
            margin-top: 15px;
            cursor: pointer;
        }

        .signup-box a {
            color: #00e5ff;
            text-decoration: none;
            display: block;
            margin-top: 15px;
        }

        .signup-box a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="signup-box">
        <h2>Signup</h2>
        <form action="signup" method="post">
            <input type="text" name="username" placeholder="Username" required><br>
            <input type="password" name="password" placeholder="Password" required><br>
            <button type="submit">Signup</button>
        </form>
        <a href="index.jsp">Already have an account? Login</a>
    </div>
</body>
</html>
