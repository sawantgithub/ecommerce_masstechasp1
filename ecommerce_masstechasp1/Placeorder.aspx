<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Placeorder.aspx.cs" Inherits="ecommerce_masstechasp1.Placeorder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 388px;
        }

        .auto-style2 {
            width: 598px;
        }

        .auto-style3 {
            width: 152px;
            height: 151px;
        }

        .auto-style4 {
            height: 151px;
        }

        .auto-style7 {
            text-decoration: underline;
        }

        .auto-style9 {
            width: 152px;
            height: 66px;
        }

        .auto-style10 {
            height: 66px;
        }

        .auto-style12 {
            width: 598px;
            height: 47px;
        }
    </style>
 <body>
   
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Download Invoice" />
        <asp:Panel ID="Panel1" runat="server">
            <table class="auto-style1" style="border-style: none">
                <tr>
                    <td class="auto-style3" style="border-style: solid">Order ID:&nbsp;&nbsp;&nbsp;&nbsp;
                       
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style4" style="border-style: solid">Email ID:&nbsp;
                       
                        <asp:Label ID="Label2" runat="server"></asp:Label>
                        &nbsp;<br />
                        <br />
                        Contact No:
                       
                        <asp:Label ID="Label3" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9" style="border-style: solid"><strong><span class="auto-style7">Seller Address:</span></strong><br />
                        <br />
                        D-104, Hawre Nirmiti CHSL, Secor 22,<br />
                        Kamothe, Panvel , Navi Mumbai.</td>
                    <td class="auto-style10" style="border-style: solid"><span class="auto-style7"><strong>Buyer Address:</strong></span><br />
                        <br />
                        <asp:Label ID="Label4" runat="server"></asp:Label>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="auto-style12" style="border-style: none">


                        <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Width="1396px" AutoGenerateColumns="False" DataKeyNames="order_id" DataSourceID="db">
                            <AlternatingRowStyle BackColor="#CCCCCC" />
                            <Columns>
                                <asp:BoundField DataField="order_id" HeaderText="order_id" InsertVisible="False" ReadOnly="True" SortExpression="order_id" />
                                <asp:BoundField DataField="user_id" HeaderText="user_id" SortExpression="user_id" />
                                <asp:BoundField DataField="product_id" HeaderText="product_id" SortExpression="product_id" />
                                <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
                                <asp:BoundField DataField="orderDate" HeaderText="orderDate" SortExpression="orderDate" />
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


                        <asp:SqlDataSource ID="db" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" SelectCommand="SELECT * FROM [orders] WHERE ([user_id] = @user_id)">
                            <SelectParameters>
                                <asp:SessionParameter Name="user_id" SessionField="user_id" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>


                    </td>

                </tr>
                <tr>
                    <td colspan="2" class="auto-style2" style="border-style: none">Grand Total :<asp:Label ID="grandtotal" runat="server" Text=""></asp:Label></td>

                </tr>
            </table>
        </asp:Panel>
    
</body>
</asp:Content>
