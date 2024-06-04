<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="AddCart.aspx.cs" Inherits="ecommerce_masstechasp1.UserHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <style>
        .delete-button {
            background-color: red;
            color: white;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 4px;
            text-align: center;
        }

            .delete-button:hover {
                background-color: darkred;
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
    <asp:GridView ID="GridView1" runat="server" DataKeyNames="cart_id" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" OnItemCommand="onDataListChange"
        OnRowCommand="GridView1_RowCommand"
        OnRowDeleting="GridView1_RowDeleting" Height="300px" HorizontalAlign="Center" Width="1200px">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:BoundField DataField="product_id" HeaderText="Product ID" />
            <asp:ImageField DataImageUrlField="product_img" HeaderText="Product Image" ControlStyle-Width="150px" ControlStyle-Height="150px">
                <ControlStyle Width="150px" Height="150px" />
            </asp:ImageField>
            <asp:BoundField DataField="product_name" HeaderText="Product Name" />
            <asp:BoundField DataField="categories" HeaderText="Categories" />
            <asp:BoundField DataField="price" HeaderText="Price" />
            <asp:BoundField DataField="cart_quantity" HeaderText="Quantity" />
            <asp:CommandField ShowDeleteButton="True" DeleteText="Remove" ShowInsertButton="False" ButtonType="Button" ControlStyle-BackColor="Red" ControlStyle-CssClass="delete-button" />
            <%--<asp:TemplateField>
                <ItemTemplate>
                    <asp:Button ID="btnEdit" CssClass="buy-now-btn" runat="server" Text="Buy Now" CommandName="buynow" CommandArgument='<%# Eval("cart_id") %>' />
                </ItemTemplate>
            </asp:TemplateField>--%>
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>

    <div class="text-center mt-3">
        <asp:Button ID="btnEdit" CssClass="buy-now-btn" runat="server" Text="Buy Now" CommandName="buynow" CommandArgument='<%# Eval("cart_id") %>' OnClick="btnEdit_Click" />
    </div>

</asp:Content>