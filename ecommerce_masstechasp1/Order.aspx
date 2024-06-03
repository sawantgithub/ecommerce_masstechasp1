<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="ecommerce_masstechasp1.Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .product-container {
            display: flex;
            flex-direction: row;
            border: 1px solid #ddd;
            padding: 20px;
            margin: 20px auto;
            max-width: 800px;
            background-color: #f9f9f9;
        }

        .product-image {
            flex: 1;
            padding: 10px;
        }

        .product-details {
            flex: 2;
            padding: 10px;
        }

        .product-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .product-category, .product-price {
            font-size: 18px;
            margin-bottom: 10px;
        }

        .buy-now-btn {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            font-size: 16px;
            border-radius: 5px;
            text-align: center;
        }

        .buy-now-btn:hover {
            background-color: #45a049;
        }
    </style>
    <body>
        <div class="product-container">
            <div class="product-image">
                <asp:Image ID="ProductImage" runat="server" Width="300px" Height="300px" />
            </div>
            <div class="product-details">
                <div class="product-title">
                    <asp:Label ID="ProductName" runat="server" Text="Product Name"></asp:Label>
                </div>
                <div class="product-category">
                    <asp:Label ID="ProductCategory" runat="server" Text="Category:"></asp:Label>
                </div>
                <div class="product-price">
                    <asp:Label ID="ProductPrice" runat="server" Text="Price:"></asp:Label>
                </div>
                <div>
                    <asp:Label ID="Usernamelabel" runat="server" Text=""></asp:Label>
                </div>
                <div>
                    <asp:Label ID="Emaillabel" runat="server" Text=""></asp:Label>
                </div>
                <div>
                    <asp:Label ID="Label3" runat="server" Text="Label">Address:</asp:Label>
                    <asp:TextBox ID="TextBox3" runat="server" style="border-radius:6px;" Width="100%" Height="32px"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label4" runat="server" Text="Label">Pincode:</asp:Label>
                    <asp:TextBox ID="TextBox4" runat="server" style="border-radius:6px;" Width="100%" Height="32px"></asp:TextBox>
                </div>
                <div>
                <asp:Label ID="Label5" runat="server" Text="Label">Number:</asp:Label>
                <asp:TextBox ID="TextBox5" runat="server" style="border-radius:6px;" Width="100%" Height="32px"></asp:TextBox>
            </div>
                    <div class="text-center mt-3">
    <asp:Button ID="BuyNowButton" runat="server" Text="Buy Now" CssClass="buy-now-btn" OnClick="BuyNowButton_Click" />
</div>
        </div>
 
    </body>
</asp:Content>
