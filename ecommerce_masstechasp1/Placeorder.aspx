﻿<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Placeorder.aspx.cs" Inherits="ecommerce_masstechasp1.Placeorder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style6 {
            width: 500px;
            height: 161px;
        }

        .auto-style11 {
            text-decoration: underline;
        }

        .auto-style12 {
            width: 100%;
            height: 362px;
        }

        .auto-style14 {
            width: 494px;
            height: 137px;
        }

        .auto-style15 {
            width: 494px;
            height: 106px;
        }

        .auto-style17 {
            width: 505px;
            height: 137px;
        }

        .auto-style18 {
            width: 505px;
            height: 106px;
        }

        .auto-style19 {
            width: 555px;
        }

        .auto-style20 {
            width: 456px;
            height: 137px;
        }

        .auto-style21 {
            width: 456px;
            height: 106px;
        }
    </style>
</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <header>
        <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    </header>

    <div class="container my-5">

        <asp:Panel ID="Panel1" runat="server">
            <div class="text-center mt-3">
                <h1>Invoice</h1>
            </div>
            <table border="1" class="auto-style12" style="border-style: double">
                <tr>
                    <td class="auto-style20"><span class="auto-style11"><strong><em>Order ID : </em></strong></span>&nbsp;
                       
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style14">
                        <span class="auto-style11"><strong><em>Username :</em></strong></span>
                        <asp:Label ID="username_label" runat="server"></asp:Label><br />
                        <br />
                        <span class="auto-style11"><strong><em>Email ID :</em></strong></span>
                        &nbsp;<asp:Label ID="Label2" runat="server"></asp:Label>
                        <br />
                        <br />
                        <span class="auto-style11"><strong><em>Contact Details :</em></strong></span>
                        &nbsp;<asp:Label ID="contact_label" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style21"><span class="auto-style11"><strong><em>Seller Address: </em></strong></span>
                        <br />
                        <br />
                        Amazon.Inc ,<br />
                        Thane West,<br />
                        Wagle Estate,400012</td>
                    <td class="auto-style15"><span class="auto-style11"><strong><em>Buyer Address: </em></strong></span>
                        <br />
                        <br />
                        <asp:Label ID="address_label" runat="server"></asp:Label>
                        <br />
                        <br />
                        <asp:Label ID="pincode_label" runat="server"></asp:Label>
                        <br />
                        <br />
                    </td>
                </tr>
                <caption>
                    <tr>
                        <td class="auto-style6" colspan="2">
                            <br />
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="order_id,product_id" DataSourceID="db" Height="300px" HorizontalAlign="Center" Width="1200px">
                                <Columns>
                                    <asp:BoundField DataField="order_id" HeaderStyle-HorizontalAlign="Center" HeaderText="Id" InsertVisible="False" ItemStyle-HorizontalAlign="Center" ReadOnly="True" SortExpression="order_id">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="product_name" HeaderStyle-HorizontalAlign="Center" HeaderText="Product" ItemStyle-HorizontalAlign="Center" SortExpression="product_name">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="price" HeaderStyle-HorizontalAlign="Center" HeaderText="price" ItemStyle-HorizontalAlign="Center" SortExpression="price">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="quantity" HeaderStyle-HorizontalAlign="Center" HeaderText="Quantity" ItemStyle-HorizontalAlign="Center" SortExpression="quantity">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="orderDate" HeaderStyle-HorizontalAlign="Center" HeaderText="Date" ItemStyle-HorizontalAlign="Center" SortExpression="orderDate">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                </Columns>
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="db" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" SelectCommand="GetOrderDetailsByUserID" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="user_id" SessionField="user_id" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style19" colspan="2">Grand Total : &nbsp;<asp:Label ID="totalPriceLabel" runat="server"></asp:Label>
                        </td>
                    </tr>
                </caption>
            </table>
        </asp:Panel>
    </div>
    <div class="text-center mt-3">
        <asp:Button ID="Button1" runat="server" Text="Download Invoice" class="btn btn-danger" OnClick="Download_Invoice" Height="50px" />&nbsp;&nbsp;&nbsp;
   
        <asp:Button ID="Button3" runat="server" class="btn-success" Text="Pay now" OnClick="Button3_Click" Height="50px" Width="131px" />
    </div>


    <br />
    <br />

</asp:Content>
