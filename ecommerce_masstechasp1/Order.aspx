<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="ecommerce_masstechasp1.Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
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

        .remove-btn {
            background-color: #dc3545;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
            font-size: 14px;
            border-radius: 5px;
            text-align: center;
        }

        .remove-btn:hover {
            background-color: #c82333;
        }

        .grid-view-table {
            width: 100%;
            border-collapse: collapse;
        }

        .grid-view-table th, .grid-view-table td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }

        .grid-view-table th {
            background-color: #f2f2f2;
        }
    </style>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="grid-view-table">
        <Columns>
            <asp:BoundField DataField="order_id" HeaderText="Order ID" />
            <asp:BoundField DataField="user_id" HeaderText="User ID" />
            <asp:BoundField DataField="orderDate" HeaderText="Order Date" />
            <asp:BoundField DataField="quantity" HeaderText="Quantity" />
            <asp:BoundField DataField="product_id" HeaderText="Product ID" />
            <asp:BoundField DataField="product_name" HeaderText="Product Name" />
            <asp:BoundField DataField="price" HeaderText="Price" />
            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                   <asp:Button ID="RemoveButton" runat="server" Text="Remove" CssClass="remove-btn" CommandName="Remove" CommandArgument='<%# Eval("order_id") %>' OnCommand="RemoveButton_Command" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="db" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" SelectCommand="GetOrderDetailsByUserID" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="user_id" SessionField="user_id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
    Total Price:
    <asp:Label ID="totalPriceLabel" runat="server" Text=" " />

    <div class="text-center mt-3">
 <asp:Button ID="BuyNowButton" runat="server" Text="Buy Now" CssClass="buy-now-btn" OnClick="BuyNowButton_Click" />
    </div>
</asp:Content>
