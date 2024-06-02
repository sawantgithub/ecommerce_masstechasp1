<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="ecommerce_masstechasp1.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
    <div class="container-fulid datalist-container">
    <asp:DataList ID="DataList1" runat="server" RepeatColumns="5" RepeatDirection="Horizontal" CellPadding="4" DataKeyField="product_id" DataSourceID="SqlDataSource1" ForeColor="#333333" >
        <alternatingitemstyle backcolor="White" forecolor="#284775" />
        <footerstyle backcolor="#5D7B9D" font-bold="True" forecolor="White" />
        <headerstyle backcolor="#5D7B9D" font-bold="True" forecolor="White" />
        <itemstyle backcolor="#F7F6F3" forecolor="#333333" />
        <itemtemplate>
            <div class="card" style="width:290px;">
                <asp:Image ID="Image1" runat="server" style="height:200px" class="card-img-top" src='<%# Eval("product_img") %>' />
                <br />
                <div class="card-body">
                  <%--  <h5 class="card-title">Product:--%>
                      <asp:Label ID="product_nameLabel" runat="server" class="card-title" Text='<%# Eval("product_name") %>' />
                   <%-- </h5>--%>
                    <br />
                    <ul class="list-group list-group-flush">
                       <%-- <li class="list-group-item">categories: --%>  
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("categories") %>' />
                       <%-- </li>--%>
                    </ul>
                    price:
                    <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                    <br />
                    quantity:
                    <asp:Label ID="quantityLabel" runat="server" Text='<%# Eval("quantity") %>' />
                    <br />
                      <asp:Button runat="server" class="btn btn-primary" Text="Add to cart" OnClick="onclick" />
                    <br />
                </div>

        </itemtemplate>
        <selecteditemstyle backcolor="#E2DED6" font-bold="True" forecolor="#333333" />
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

</asp:Content>
