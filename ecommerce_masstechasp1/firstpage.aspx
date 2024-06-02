<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="firstpage.aspx.cs" Inherits="ecommerce_masstechasp1.firstpage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <title>Ecommerce</title>
<style>
        .datalist-container {
            margin: 0 auto;
            padding: 20px;
        }
        .datalist-item {
            margin-bottom: 20px;
        }
    </style>
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
        
        <li class="nav-item active" style="margin-left:60rem;">
  <a class="nav-link" href="Login.aspx">Login<span class="sr-only">(current)</span></a></li>

  <%--      <li class="nav-item active">
  <a class="nav-link" href="Register.aspx">Resigter<span class="sr-only">(current)</span></a>             
</li>  --%>    
         <li class="nav-item">
                    <a class="nav-link" href="#">
                        <span class="fas fa-shopping-cart"></span>
                        Cart
                        <span class="badge badge-pill badge-danger">3</span>
                    </a>
                </li>
    </ul>
  </div>
</nav>
        </div>
                <div id="carouselExampleControls" class="carousel slide" data-ride="carousel" style="height:250px">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img class="d-block w-100" style="height:250px" style="object-fit: contain" src="https://m.media-amazon.com/images/I/61H3B5rmlyL._SX1500_.jpg" alt="First slide">
        </div>
        <div class="carousel-item">
            <img class="d-block w-100"  style="height:250px" style="object-fit: contain" src="https://m.media-amazon.com/images/I/81UdfCXqUoL._SX3000_.jpg" alt="Second slide">
        </div>
        <div class="carousel-item">
            <img class="d-block w-100"  style="height:250px"  style="object-fit: contain" src="https://m.media-amazon.com/images/I/B1xWNAn+paL._SX3000_.jpg" alt="Third slide">
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
           <!-- Category -->
        <%-- <h5 style="font-family: 'Arial', sans-serif; font-size: 36px; color: black; text-align: center;">Category</h5>--%>
         <div style="display:flex;margin-left:15rem">
            
             <div style="width:15%">
                 <asp:Image ID="Image1" runat="server" style="height:100px;width:100px"  src="https://rukminim2.flixcart.com/flap/80/80/image/69c6589653afdb9a.png?q=100" />   
                 <h6>Electronics</h6>
             </div>
             <div style="width:15%">
                 <asp:Image ID="Image2" runat="server" style="height:100px;width:100px"   src="https://rukminim1.flixcart.com/fk-p-flap/80/80/image/0d75b34f7d8fbcb3.png?q=100" /> 
                 <h6>Fashion</h6>
             </div>
             <div style="width:15%">
                 <asp:Image ID="Image3" runat="server" style="height:100px;width:100px"  src="https://rukminim2.flixcart.com/image/832/832/xif0q/jean/2/x/b/13-14-years-junhpsjoggerboy-lgrey-urbano-juniors-original-imafpm83zszw3dfn-bb.jpeg?q=70&amp;crop=false" />
                 <h6>Menswear</h6>
             </div>
             <div style="width:15%">
                 <asp:Image ID="Image4" runat="server" style="height:100px;width:100px"  src="https://rukminim2.flixcart.com/image/832/832/xif0q/shoe/a/h/h/6-dc3728-400-6-nike-dk-obsdn-hypr-ryl-black-gry-fg-original-imagzfd3z89cyb2n.jpeg?q=70&amp;crop=false" />
                 <h6>Shoes</h6>
             </div>
             <div style="width:15%">
                 <asp:Image ID="Image5" runat="server" style="height:100px;width:100px"  src="https://rukminim1.flixcart.com/flap/80/80/image/22fddf3c7da4c4f4.png?q=100" />
                 <h6>Smartphones</h6>
             </div>
             <div style="width:15%">
                 <asp:Image ID="Image6" runat="server" style="height:100px;width:100px"  src="https://rukminim2.flixcart.com/image/416/416/xif0q/ball/d/d/c/420-470-cyclone-5-24-1-mfb616-football-mayor-original-imagwwkfhjz2vjzc.jpeg?q=70&amp;crop=false" />
                 <h6>Sports</h6>
              </div>

         </div>
         <br />
<!--------------------     Datalist start --------------------------------->
       <%--  <h1 style="font-family: 'Arial', sans-serif; font-size: 36px; color: black; text-align: center;">Buy Now</h1><br />--%>
         <div class="container-fulid datalist-container">
            <asp:DataList ID="DataList1" runat="server" RepeatColumns="5" RepeatDirection="Horizontal" CellPadding="4" DataKeyField="product_id" DataSourceID="SqlDataSource1" ForeColor="#333333">
                <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <ItemTemplate>
                    <%--<div class="card datalist-item" style="width:290px;">
                        <asp:Image ID="Image1" runat="server" style="height:200px;" class="card-img-top" ImageUrl='<%# Eval("product_img") %>' />
                        <div class="card-body">
                            <asp:Label ID="product_nameLabel" runat="server" class="card-title" Text='<%# Eval("product_name") %>' />
                            <ul class="list-group list-group-flush">
                             <asp:Label ID="Label1" runat="server" class="list-group-item" Text='<%# Eval("categories") %>' />
                            </ul>
                            <div>
                                Price: <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                            </div>
                            <button type="button" class="btn btn-primary mt-2">Add to cart</button>
                        </div>
                    </div>--%>
                     <div class="card" style="width:290px;">
            <asp:Image ID="Image1" runat="server" style="height:200px" class="card-img-top" src='<%# Eval("product_img") %>' />
            <br />
            <div class="card-body" >
                <%--<h5 class="card-title">Product:--%>
                 <%-- <asp:Label ID="product_nameLabel" runat="server" class="card-title" Text='<%# Eval("product_name") %>' />
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

                </ItemTemplate>
                <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            </asp:DataList>
        </div>

<!----------------------------      Datalist End ----------------------------------------------->
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" SelectCommand="EXEC FetchProducts"></asp:SqlDataSource>
<!----------------------------      Footer start ----------------------------------------------->
<br />

         <!---------------------------- Offers------------------------------------ -->
         <%--<h1 style="font-family: 'Arial', sans-serif; font-size: 36px; color: black; text-align: center;">Offers %</h1><br />--%>
      <div class="container-fluid">
        <div class="row row-cols-1 row-cols-md-3 g-4">
  <div class="col" style="height:250px;width:250px;">
    <div class="card h-100" style="height:250px;width:250px;">
      <img  style="height:250px;width:250px;" src="https://assets.myntassets.com/w_163,c_limit,fl_progressive,dpr_2.0/assets/images/2024/5/17/6f1538b8-4be4-4971-8d21-e67731cc1fad1715935572430-Roadster_Bestsellers_-_Min_65.png" class="card-img-top" alt="...">
    </div>
  </div>
  <div class="col"  style="height:250px;width:250px;">
    <div class="card h-100"  style="height:250px;width:250px;">
      <img  style="height:250px;width:250px;" src="https://assets.myntassets.com/w_163,c_limit,fl_progressive,dpr_2.0/assets/images/2024/5/19/af85b317-a90f-4661-ab65-c330df7d3e091716101461714-image_png716168130.png" class="card-img-top" alt="...">
 
    </div>
  </div>
  <div class="col"  style="height:250px;width:250px;">
    <div class="card h-100"  style="height:250px; width:250px;">
      <img  style="height:250px;width:250px;" src="https://assets.myntassets.com/w_163,c_limit,fl_progressive,dpr_2.0/assets/images/2024/5/30/096e94e3-1a27-4794-b723-433b21cb43941717053164472-image_png_1060232997.png" class="card-img-top" alt="...">
    </div>
  </div>
  <div class="col"  style="height:250px;width:250px;">
    <div class="card h-100"  style="height:250px;width:250px;">
      <img  style="height:250px;width:250px;" src="https://assets.myntassets.com/w_163,c_limit,fl_progressive,dpr_2.0/assets/images/2024/5/19/b2f0a7af-ca02-47cf-ae0d-b2f8699f44261716102962688-image_png_648541676.png" class="card-img-top" alt="...">
    </div>
  </div>
   <div class="col"  style="height:250px;width:250px;">
  <div class="card h-100"  style="height:250px;width:250px;">
    <img  style="height:250px;width:250px;" src="https://assets.myntassets.com/w_163,c_limit,fl_progressive,dpr_2.0/assets/images/2024/5/19/54e474b7-cb71-4fb6-830c-9c895e66955e1716103213433-image_png_1725801546.png" class="card-img-top" alt="...">
  </div>
</div>
</div>
</div>

                 <!-- Footer -->
        <footer class="bg-dark text-white mt-5" style="padding-top:3rem;justify-content:space-between">
            <div class="container">
                <div class="row">
                    <div class="col-6 col-md-2">
                        <h5>Useful Links</h5>
                        <ul class="nav flex-column">
                            <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-white">Home</a></li>
                            <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-white">About us</a></li>
                            <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-white">View Cart</a></li>
                            <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-white">Login</a></li>
                            <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-white">Register</a></li>
                        </ul>
                    </div>
                    <div class="col-6 col-md-2">
                        <h5>Categories</h5>
                        <ul class="nav flex-column">
                            <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-white">Electronics </a></li>
                            <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-white">Shoes</a></li>
                            <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-white">Fashion</a></li>
                            <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-white">Menswear</a></li>
                            <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-white">Cosmetics</a></li>
                        </ul>
                    </div>
                    <div class="col-md-4 offset-md-1">
                        
                            <h5>Stay connected with us !</h5>
                            <p>Never miss out on exclusive deals! Follow us on our social media channels to get the latest updates, fashion trends, and special promotions. As a token of our appreciation, enjoy a whopping 60% discount on our latest fashion collection. Join our community now and be the first to know about our hottest new arrivals and limited-time offers!

</p>
                    
                            </div>
                     <div class="bg-dark text-white pt-4 mt-4" style="margin-right:1rem">
        <div class="container text-center" >
            <div class="row">
                <div class="col-md-12">
                    <h5>Follow Us</h5>
                    <a href="https://www.facebook.com" class="text-white mr-4" target="_blank"><i class="fab fa-facebook fa-2x"></i></a>
                    <a href="https://www.twitter.com" class="text-white mr-4" target="_blank"><i class="fab fa-twitter fa-2x"></i></a>
                    <a href="https://www.instagram.com" class="text-white mr-4" target="_blank"><i class="fab fa-instagram fa-2x"></i></a>
                    <a href="https://www.linkedin.com" class="text-white mr-4" target="_blank"><i class="fab fa-linkedin fa-2x"></i></a>
                </div>
            </div>
        </div>
        <div class="text-center py-3">
            © 2024 Your Company Name
        </div>
    </div>
                    </div>
                </div>
                <div class="d-flex justify-content-between  border-top" >
                    <p style="margin-left:40rem;font-size:1.3rem">© Thank You, for Visiting us!.</p>
                </div>
            </div>
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
