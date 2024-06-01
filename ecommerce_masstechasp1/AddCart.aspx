<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="AddCart.aspx.cs" Inherits="ecommerce_masstechasp1.UserHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" DataSourceID="SqlDataSource1">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="product_id" HeaderText="Product ID" />
                 <asp:ImageField DataImageUrlField="product_img" HeaderText="Product Image" ControlStyle-Width="150px" ControlStyle-Height="150px">
     <ControlStyle Width="150px" Height="150px" />
 </asp:ImageField>
                <asp:BoundField DataField="product_name" HeaderText="Product Name" />
                <asp:BoundField DataField="categories" HeaderText="Categories" />
                <asp:BoundField DataField="price" HeaderText="Price" />
                <asp:BoundField DataField="quantity" HeaderText="Quantity" />
                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
</asp:Content>
