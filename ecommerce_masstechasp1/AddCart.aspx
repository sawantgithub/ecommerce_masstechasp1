<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="AddCart.aspx.cs" Inherits="ecommerce_masstechasp1.UserHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br /><br />

    <asp:GridView ID="GridView1" runat="server" DataKeyNames="cart_id" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" OnItemCommand="onDataListChange"
        OnRowCommand="GridView1_RowCommand"
        OnRowEditing="GridView1_RowEditing"
        OnRowUpdating="GridView1_RowUpdating"
        OnRowCancelingEdit="GridView1_RowCancelingEdit"
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
            <asp:CommandField ShowDeleteButton="True" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button ID="btnEdit" runat="server" Text="Buy Now" CommandName="buynow" CommandArgument='<%# Eval("cart_id") %>' />
                </ItemTemplate>
            </asp:TemplateField>
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
        
</asp:Content>
