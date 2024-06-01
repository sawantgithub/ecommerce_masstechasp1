<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="AddCart.aspx.cs" Inherits="ecommerce_masstechasp1.UserHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    hello Cart
    <asp:GridView runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="cart_id" DataSourceID="SqlDataSource2" PageSize="5">
    <Columns>
        <asp:BoundField DataField="cart_id" HeaderText="cart_id" InsertVisible="False" ReadOnly="True" SortExpression="cart_id" />
        <asp:BoundField DataField="user_id" HeaderText="user_id" SortExpression="user_id" />
        <asp:BoundField DataField="product_id" HeaderText="product_id" SortExpression="product_id" />
        <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
        <asp:BoundField DataField="product_img" HeaderText="product_img" SortExpression="product_img" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" SelectCommand="FetchCart" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:Parameter Name="userId" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
</asp:Content>
