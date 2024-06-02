<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="ecommerce_masstechasp1.AddProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <br /><br />

            <style>
        body {
            background-image: url('https://img.freepik.com/premium-photo/time-buying-present-concept-flat-lay-top-close-up-view-photo-mini-metal-little-pushcart-falling-tiny-shiny-present-boxes-isolated-light-pastel-color-background-with-empty-space_352249-3064.jpg');
           background-repeat: no-repeat;
            background-size: cover;
        }
    </style>
 
   <div style="width: 500px; border: 5px solid black; margin: 50px auto; border-radius: 1rem; background-color: rgba(255, 255, 255, 0.2);"><br />
        <h1 style="font-family: 'Arial', sans-serif; font-size: 36px; font-weight: bold; color: black; text-align: center;">Add Product</h1><br />
        <div class="form-group">
            <label for="productName" style="color: black;margin-left:100px;font-family: 'Arial', sans-serif; font-size: 20px;">Product Name:</label>
            <asp:TextBox ID="TextBox1" class="form-control" runat="server" placeholder="Enter Product Name" style="border-radius:6px;border:2px solid black;margin-left:100px" Width="60%" Height="45px" ></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="categories" style="color: black;margin-left:100px;font-family: 'Arial', sans-serif; font-size: 20px;">Categories</label>
            <asp:TextBox ID="TextBox2" class="form-control" runat="server" placeholder="Enter Categories"  style="border-radius:6px;border:2px solid black;margin-left:100px" Width="60%" Height="45px" ></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="price" style="color: black;margin-left:100px;font-family: 'Arial', sans-serif; font-size: 20px;">Price</label>
            <asp:TextBox ID="TextBox3" class="form-control" runat="server" placeholder="Enter Price"  style="border-radius:6px;border:2px solid black;margin-left:100px" Width="60%" Height="45px"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="quantity" style="color: black;margin-left:100px;font-family: 'Arial', sans-serif; font-size: 20px;">Quantity</label>
            <asp:TextBox ID="TextBox4" class="form-control" runat="server" placeholder="Enter Quantity"  style="border-radius:6px;border:2px solid black;margin-left:100px" Width="60%" Height="45px"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="productImg" style="color: black;margin-left:100px;font-family: 'Arial', sans-serif; font-size: 20px;">Product Image</label>
            <asp:FileUpload ID="FileUpload1" class="form-control" runat="server" style="border-radius:6px;border:2px solid black;margin-left:100px" Width="60%" Height="45px" />
        </div>
       <div class="text-center mt-3">
        <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="Save" OnClick="Button1_Click" />
        <asp:Label ID="lblMessage" runat="server" CssClass="text-success mt-3 d-block" />
           </div>
    </div>
 
    
</asp:Content>
