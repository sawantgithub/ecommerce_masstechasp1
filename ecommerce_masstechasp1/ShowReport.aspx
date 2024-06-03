<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ShowReport.aspx.cs" Inherits="ecommerce_masstechasp1.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <div>
        <style>
                  .delete-button {
     background-color: #20B0D4;
     color: black;
     border: none;
     padding: 10px 20px;
     text-align: center;
     text-decoration: none !important;
     display: inline-block;
     font-size: 14px;
     margin: 4px 2px;
     cursor: pointer;
     border-radius: 4px;
     text-align:center;
 }
 .delete-button:hover {
     background-color: darkred;
 }
        </style>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="product_id" DataSourceID="SqlDataSource1" GridLines="Vertical" PageSize="5" Height="300px" HorizontalAlign="Center" Width="1200px">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
               
                <asp:BoundField DataField="product_id" HeaderText="product_id" InsertVisible="False" ReadOnly="True" SortExpression="product_id" />
                <asp:ImageField DataImageUrlField="product_img" HeaderText="Product Image" ControlStyle-Height="100px" ControlStyle-Width="100px" >
<ControlStyle Height="100px" Width="100px"></ControlStyle>
                </asp:ImageField>
                <asp:BoundField DataField="product_name" HeaderText="product_name" SortExpression="product_name" />
                <asp:BoundField DataField="categories" HeaderText="categories" SortExpression="categories" />
                <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
                 <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ControlStyle-CssClass="delete-button" />
              
            </Columns>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <SortedAscendingCellStyle BackColor="#F4F4FD" />
            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
            <SortedDescendingCellStyle BackColor="#D8D8F0" />
            <SortedDescendingHeaderStyle BackColor="#3E3277" />
        </asp:GridView>  
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:dbconn %>" DeleteCommand="DELETE FROM [products] WHERE [product_id] = @original_product_id AND [product_name] = @original_product_name AND [categories] = @original_categories AND [price] = @original_price AND (([product_img] = @original_product_img) OR ([product_img] IS NULL AND @original_product_img IS NULL)) AND (([quantity] = @original_quantity) OR ([quantity] IS NULL AND @original_quantity IS NULL))" InsertCommand="INSERT INTO [products] ([product_name], [categories], [price], [product_img], [quantity]) VALUES (@product_name, @categories, @price, @product_img, @quantity)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [products]" UpdateCommand="UPDATE [products] SET [product_name] = @product_name, [categories] = @categories, [price] = @price, [product_img] = @product_img, [quantity] = @quantity WHERE [product_id] = @original_product_id AND [product_name] = @original_product_name AND [categories] = @original_categories AND [price] = @original_price AND (([product_img] = @original_product_img) OR ([product_img] IS NULL AND @original_product_img IS NULL)) AND (([quantity] = @original_quantity) OR ([quantity] IS NULL AND @original_quantity IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_product_id" Type="Int32" />
                <asp:Parameter Name="original_product_name" Type="String" />
                <asp:Parameter Name="original_categories" Type="String" />
                <asp:Parameter Name="original_price" Type="Decimal" />
                <asp:Parameter Name="original_product_img" Type="String" />
                <asp:Parameter Name="original_quantity" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="product_name" Type="String" />
                <asp:Parameter Name="categories" Type="String" />
                <asp:Parameter Name="price" Type="Decimal" />
                <asp:Parameter Name="product_img" Type="String" />
                <asp:Parameter Name="quantity" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="product_name" Type="String" />
                <asp:Parameter Name="categories" Type="String" />
                <asp:Parameter Name="price" Type="Decimal" />
                <asp:Parameter Name="product_img" Type="String" />
                <asp:Parameter Name="quantity" Type="Int32" />
                <asp:Parameter Name="original_product_id" Type="Int32" />
                <asp:Parameter Name="original_product_name" Type="String" />
                <asp:Parameter Name="original_categories" Type="String" />
                <asp:Parameter Name="original_price" Type="Decimal" />
                <asp:Parameter Name="original_product_img" Type="String" />
                <asp:Parameter Name="original_quantity" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    <br />
    <br />
         <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="user_id" DataSourceID="SqlDataSource2" ForeColor="Black" GridLines="Vertical" Height="300px" HorizontalAlign="Center" Width="1200px">
             <AlternatingRowStyle BackColor="#CCCCCC" />
             <Columns>
                
                 <asp:BoundField DataField="user_id" HeaderText="user_id" InsertVisible="False" ReadOnly="True" SortExpression="user_id" />
                 <asp:BoundField DataField="username" HeaderText="username" SortExpression="username" />
                 <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                 <asp:BoundField DataField="passkey" HeaderText="passkey" SortExpression="passkey" />
                 <asp:BoundField DataField="urole" HeaderText="urole" SortExpression="urole" />
                  <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ControlStyle-CssClass="delete-button"/>
             </Columns>
             <EditRowStyle BackColor="Blue" BorderColor="Blue" />
             <FooterStyle BackColor="#CCCCCC" />
             <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
             <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
             <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
             <SortedAscendingCellStyle BackColor="#F1F1F1" />
             <SortedAscendingHeaderStyle BackColor="#808080" />
             <SortedDescendingCellStyle BackColor="#CAC9C9" />
             <SortedDescendingHeaderStyle BackColor="#383838" />
         </asp:GridView>
    <br />
    <br />
     <div>
         <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:dbconn %>" DeleteCommand="DELETE FROM [Users] WHERE [user_id] = @original_user_id AND (([username] = @original_username) OR ([username] IS NULL AND @original_username IS NULL)) AND (([email] = @original_email) OR ([email] IS NULL AND @original_email IS NULL)) AND (([passkey] = @original_passkey) OR ([passkey] IS NULL AND @original_passkey IS NULL)) AND (([urole] = @original_urole) OR ([urole] IS NULL AND @original_urole IS NULL))" InsertCommand="INSERT INTO [Users] ([username], [email], [passkey], [urole]) VALUES (@username, @email, @passkey, @urole)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Users]" UpdateCommand="UPDATE [Users] SET [username] = @username, [email] = @email, [passkey] = @passkey, [urole] = @urole WHERE [user_id] = @original_user_id AND (([username] = @original_username) OR ([username] IS NULL AND @original_username IS NULL)) AND (([email] = @original_email) OR ([email] IS NULL AND @original_email IS NULL)) AND (([passkey] = @original_passkey) OR ([passkey] IS NULL AND @original_passkey IS NULL)) AND (([urole] = @original_urole) OR ([urole] IS NULL AND @original_urole IS NULL))">
             <DeleteParameters>
                 <asp:Parameter Name="original_user_id" Type="Int32" />
                 <asp:Parameter Name="original_username" Type="String" />
                 <asp:Parameter Name="original_email" Type="String" />
                 <asp:Parameter Name="original_passkey" Type="String" />
                 <asp:Parameter Name="original_urole" Type="String" />
             </DeleteParameters>
             <InsertParameters>
                 <asp:Parameter Name="username" Type="String" />
                 <asp:Parameter Name="email" Type="String" />
                 <asp:Parameter Name="passkey" Type="String" />
                 <asp:Parameter Name="urole" Type="String" />
             </InsertParameters>
             <UpdateParameters>
                 <asp:Parameter Name="username" Type="String" />
                 <asp:Parameter Name="email" Type="String" />
                 <asp:Parameter Name="passkey" Type="String" />
                 <asp:Parameter Name="urole" Type="String" />
                 <asp:Parameter Name="original_user_id" Type="Int32" />
                 <asp:Parameter Name="original_username" Type="String" />
                 <asp:Parameter Name="original_email" Type="String" />
                 <asp:Parameter Name="original_passkey" Type="String" />
                 <asp:Parameter Name="original_urole" Type="String" />
             </UpdateParameters>
         </asp:SqlDataSource>
     </div>
<!----------------------------      Footer end ----------------------------------------------->
</asp:Content>
