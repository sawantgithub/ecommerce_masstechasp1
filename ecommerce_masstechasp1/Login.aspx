<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ecommerce_masstechasp1.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.1.0/css/bootstrap.min.css" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRkW3GYoHR1Q1mrz4x+6ep29X+6v9v2lpbL9FErcD" crossorigin="anonymous">
     <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.1.0/js/bootstrap.bundle.min.js" integrity="sha384-U1OQN8AuqVjx6v4tOzFIR8Czpe6TEdZh9U/Cg0DQHuxh/R19P/hGvB+VVQ7HXSwk" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
<div style="width:30%;border:5px solid blue;padding:20px;margin:auto">
  <div class="mb-3">
 <label for="exampleInputPassword1" class="form-label">Username or Email :<br />
 </label>&nbsp;<asp:TextBox ID="TextBox1" runat="server" placeholder ="Enter Username or Email" Width="136px"></asp:TextBox>
  </div>
<div class="mb-3">
 <label for="exampleInputPassword1" class="form-label">Password :<br />
</label><asp:TextBox ID="TextBox2" runat="server" placeholder ="Enter Password"></asp:TextBox>
</div>
<asp:Button ID="Button1" runat="server" class="btn btn-primary" Text="Login" OnClick="Button1_Click" />
    <asp:Label ID="Label1" runat="server"></asp:Label>
   
    <br />
    <br />
   
       <div class="text-center mt-3">
        <a href="Register.aspx">Register</a>
        </div>
</div>
    </form>
</body>
</html>
