<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ecommerce_masstechasp1.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <title>Ecommerce</title>
            <style>
        body {
            background-image: url('https://img.freepik.com/premium-photo/time-buying-present-concept-flat-lay-top-close-up-view-photo-mini-metal-little-pushcart-falling-tiny-shiny-present-boxes-isolated-light-pastel-color-background-with-empty-space_352249-3064.jpg');
           background-repeat: no-repeat;
            background-size: cover;
        }
    </style>
    </head>
<body>
    <form id="form1" runat="server">
  <div style="width: 400px; border: 5px solid black; margin: 150px auto; border-radius: 1rem; background-color: rgba(255, 255, 255, 0.2);"><br />
        <h1 style="font-family: 'Arial', sans-serif; font-size: 36px; font-weight: bold; color: black; text-align: center;">Register</h1><br />
  <div class="mb-3">
 <label for="TextBox1" class="form-label"  style="color: black;margin-left:100px;font-family: 'Arial', sans-serif; font-size: 20px;">Username:</label><br />
<asp:TextBox ID="TextBox1" runat="server" placeholder="Enter Username" style="border-radius:6px;margin-left:100px" Width="50%" Height="32px"></asp:TextBox>
  </div>
 <div class="mb-3">
   <label for="email" class="form-label"  style="color: black;margin-left:100px;font-family: 'Arial', sans-serif; font-size: 20px;">Email:</label>
 <asp:TextBox ID="txtEmail" CssClass="form-control" placeholder ="Enter Email" runat="server" style="border-radius:6px; border:2px solid black;margin-left:100px" Width="50%" Height="32px" />
   </div>
<div class="mb-3">
 <label for="exampleInputPassword1" class="form-label" style="color: black;margin-left:100px;font-family: 'Arial', sans-serif; font-size: 20px;">Password :
</label><asp:TextBox ID="TextBox2" runat="server" placeholder ="Enter Password" style="border-radius:6px; border:2px solid black;margin-left:100px" Width="50%" Height="32px"></asp:TextBox>
</div>
       <div class="text-center mt-3">
 <asp:Button ID="btnRegister" runat="server" CssClass="btn btn-primary" Text="Register" OnClick="btnRegister_Click" />
           </div><br />
      <br />
</div>
    </form>
</body>
</html>
