<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="firstpage.aspx.cs" Inherits="ecommerce_masstechasp1.firstpage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <title>Ecommerce</title>
</head>
<body>
     <form id="form1" runat="server">
<div>
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="Login.aspx">Welcome ShopNow</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="Login.aspx">Home <span class="sr-only">(current)</span></a>
      </li>
        <li class="nav-item active">
  <a class="nav-link" href="Login.aspx">login<span class="sr-only">(current)</span></a></li><li class="nav-item active">
  <a class="nav-link" href="Register.aspx">Resigter<span class="sr-only">(current)</span></a>
</li>      
    </ul>
  </div>
</nav>
        </div>
                <div id="carouselExampleControls" class="carousel slide" data-ride="carousel" style="height:400px">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img class="d-block w-100" style="height:400px" style="object-fit: contain" src="https://m.media-amazon.com/images/I/61H3B5rmlyL._SX1500_.jpg" alt="First slide">
        </div>
        <div class="carousel-item">
            <img class="d-block w-100"  style="height:400px" style="object-fit: contain" src="https://m.media-amazon.com/images/I/81UdfCXqUoL._SX3000_.jpg" alt="Second slide">
        </div>
        <div class="carousel-item">
            <img class="d-block w-100"  style="height:400px"  style="object-fit: contain" src="https://m.media-amazon.com/images/I/B1xWNAn+paL._SX3000_.jpg" alt="Third slide">
        </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    

</div>
            </a>
<br />
<!--------------------     Datalist start --------------------------------->
<asp:DataList ID="DataList1" runat="server" RepeatColumns="5" RepeatDirection="Horizontal" CellPadding="4" DataKeyField="product_id" DataSourceID="SqlDataSource1" ForeColor="#333333" >
    <alternatingitemstyle backcolor="White" forecolor="#284775" />
    <footerstyle backcolor="#5D7B9D" font-bold="True" forecolor="White" />
    <headerstyle backcolor="#5D7B9D" font-bold="True" forecolor="White" />
    <itemstyle backcolor="#F7F6F3" forecolor="#333333" />
    <itemtemplate>
        <div class="card" style="width: 18rem;">
            <asp:Image ID="Image1" runat="server" style="height:300px" class="card-img-top" src='<%# Eval("product_img") %>' />
            <br />
            <div class="card-body" >
                <%--<h5 class="card-title">Product:--%>
                  <asp:Label ID="product_nameLabel" runat="server" class="card-title" Text='<%# Eval("product_name") %>' />
<%--                </h5>--%>
                <br />
                <ul class="list-group list-group-flush">
                    <%--<li class="list-group-item">categories: --%>  
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("categories") %>' />
                    <%--</li>--%>
                </ul>
                price:
                <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                <br />
               <%-- quantity:
                <asp:Label ID="quantityLabel" runat="server" Text='<%# Eval("quantity") %>' />--%>
                <br />
                  <%--<asp:Button runat="server" class="btn btn-primary" Text="Add to cart"  />--%>
                <button type="button" class="btn btn-primary">Add to cart</button>
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
   </form>
    <script type="text/javascript">
    document.addEventListener("click", function () {
        window.location.href = "Login.aspx";
    });
</script>
</body>

</html>
