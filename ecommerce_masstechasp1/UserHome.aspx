<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="UserHome.aspx.cs" Inherits="ecommerce_masstechasp1.UserHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img class="d-block w-100" style="object-fit: contain" src="https://m.media-amazon.com/images/I/61H3B5rmlyL._SX1500_.jpg" alt="First slide">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" style="object-fit: contain" src="https://m.media-amazon.com/images/I/81UdfCXqUoL._SX3000_.jpg" alt="Second slide">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" style="object-fit: contain" src="https://m.media-amazon.com/images/I/B1xWNAn+paL._SX3000_.jpg" alt="Third slide">
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>

    </div>
    <!--------------------     Datalist start --------------------------------->
    <asp:DataList ID="DataList1" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" CellPadding="4" DataKeyField="product_id" DataSourceID="SqlDataSource1" ForeColor="#333333">
        <alternatingitemstyle backcolor="White" forecolor="#284775" />
        <footerstyle backcolor="#5D7B9D" font-bold="True" forecolor="White" />
        <headerstyle backcolor="#5D7B9D" font-bold="True" forecolor="White" />
        <itemstyle backcolor="#F7F6F3" forecolor="#333333" />
        <itemtemplate>
            <div class="card" style="width: 18rem;">
                <img src="..." class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">An item</li>
                    <li class="list-group-item">A second item</li>
                    <li class="list-group-item">A third item</li>
                </ul>
                <div class="card-body">
                    <a href="#" class="card-link">Card link</a>
                    <a href="#" class="card-link">Another link</a>
                </div>
            </div>
            <div class="card" style="width: 18rem;">
                <asp:Image ID="Image1" runat="server" class="card-img-top" src='<%# Eval("product_img") %>' />
                <br />
                <div class="card-body">
                    <h5 class="card-title">Product:
                      <asp:Label ID="product_nameLabel" runat="server" class="card-title" Text='<%# Eval("product_name") %>' />
                    </h5>
                    <br />
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">categories:   
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("categories") %>' />
                        </li>
                    </ul>

                    <br />
                    price:
               
                    <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                    <br />
                    quantity:
               
                    <asp:Label ID="quantityLabel" runat="server" Text='<%# Eval("quantity") %>' />
                    <asp:Button runat="server" class="btn btn-primary" Text="Button" />

                    <br />
                    <br />
                </div>
        </itemtemplate>
        <selecteditemstyle backcolor="#E2DED6" font-bold="True" forecolor="#333333" />
    </asp:DataList>

    <!----------------------------      Datalist End ----------------------------------------------->
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" SelectCommand="EXEC FetchProducts"></asp:SqlDataSource>
    <!----------------------------      Footer start ----------------------------------------------->
    <footer style="background-color: antiquewhite">
        <ul>
            <li>Thank yoy for visiting us!</li>
            <li>About</li>
            <li>You can connect with us</li>
        </ul>
    </footer>
    <!----------------------------      Footer end ----------------------------------------------->
</asp:Content>
