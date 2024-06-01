<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="ecommerce_masstechasp1.AddProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <br /><br />

    <div style="width:30%;border:5px solid blue;padding:50px;margin-left:30%">
        <div class="form-group">
            <label for="productName">Product Name</label>
            <asp:TextBox ID="TextBox1" class="form-control" runat="server" placeholder="Enter Product Name"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="categories">Categories</label>
            <asp:TextBox ID="TextBox2" class="form-control" runat="server" placeholder="Enter Categories"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="price">Price</label>
            <asp:TextBox ID="TextBox3" class="form-control" runat="server" placeholder="Enter Price"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="quantity">Quantity</label>
            <asp:TextBox ID="TextBox4" class="form-control" runat="server" placeholder="Enter Quantity"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="productImg">Product Image</label>
            <asp:FileUpload ID="FileUpload1" class="form-control" runat="server" />
        </div>

        <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="Save" OnClick="Button1_Click" />
        <asp:Label ID="lblMessage" runat="server" CssClass="text-success mt-3 d-block" />
    </div>

    
</asp:Content>
