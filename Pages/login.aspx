<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="FiveS.Pages.login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <style>
        /* Full page background */
        body, html {
            height: 100%;
            margin: 0;
            font-family: Arial, sans-serif;
            background: url('../Images/bg.png') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        /* Login box */
        .login-box {
            background: rgba(255, 255, 255, 0.75); /* semi-transparent */
            padding: 40px 30px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.35);
            text-align: center;
            width: 380px;
            position: relative;
            backdrop-filter: blur(5px); /* subtle blur behind */
        }

        /* User icon */
        .login-box .user-icon {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            margin-bottom: 20px;
            background: url('../Images/mainuser.png') no-repeat center center;
            background-size: cover;
            display: inline-block;
        }

        /* Input fields */
        .login-box input[type="text"],
        .login-box input[type="password"] {
            width: 100%;
            padding: 12px 15px;
            margin: 10px 0;
            border-radius: 8px;
            border: 1px solid #ccc;
            box-sizing: border-box;
            font-size: 16px;
            background: rgba(255,255,255,0.9);
        }

        /* Submit button */
        .login-box input[type="submit"] {
            width: 100%;
            padding: 12px;
            margin-top: 15px;
            border-radius: 8px;
            border: none;
            background: #007BFF;
            color: white;
            font-size: 18px;
            cursor: pointer;
            transition: background 0.3s;
        }

        .login-box input[type="submit"]:hover {
            background: #0056b3;
        }

        /* Optional: placeholder styling */
        ::placeholder {
            color: #888;
        }

        /* Error message styling */
        .error-message {
            color: red;
            margin-top: 10px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-box">
            <div class="user-icon"></div>
            <asp:TextBox ID="txtUsername" runat="server" placeholder="Username" CssClass="form-input"></asp:TextBox>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password" CssClass="form-input"></asp:TextBox>
            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn-submit" OnClick="btnLogin_Click"/>
            <asp:Label ID="lblMessage" runat="server" CssClass="error-message"></asp:Label>
        </div>
    </form>
</body>
</html>
