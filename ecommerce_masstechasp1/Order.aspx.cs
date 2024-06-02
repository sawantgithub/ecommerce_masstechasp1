using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using Razorpay.Api;

namespace ecommerce_masstechasp1
{
    public partial class Order : Page
    {
        private int cartId;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CartToOrder"] != null)
                {
                    cartId = int.Parse(Session["CartToOrder"].ToString());
                    if (cartId > 0)
                    {
                        Usernamelabel.Text = Session["username"].ToString();
                        Emaillabel.Text = Session["email"].ToString();
                        LoadProductDetails(cartId);
                    }

                }
            }
        }

        private void LoadProductDetails(int cartId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("FetchProductByCartId", conn))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@cartId", cartId);
                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            ProductImage.ImageUrl = reader["product_img"].ToString();
                            ProductName.Text = reader["product_name"].ToString();
                            ProductCategory.Text = "Category: " + reader["categories"].ToString();
                            ProductPrice.Text = "Price: ₹" + reader["price"].ToString();
                        }
                    }
                }
            }
        }

        protected void BuyNowButton_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["CartToOrder"] != null)
                {
                    cartId = int.Parse(Session["CartToOrder"].ToString());
                    LoadProductDetails(cartId);

                    string keyId = "rzp_test_UMVGiuA5sKQxEW";
                    string keySecret = "mt9CiFHhiphKs5khoGENBZbB";
                    RazorpayClient razorpayClient = new RazorpayClient(keyId, keySecret);

                    decimal amount = decimal.Parse(ProductPrice.Text.Replace("Price: ₹", "")) * 100; // Convert amount to paisa
                    string address = TextBox3.Text;
                    string pincode = TextBox4.Text;
                    string contact = TextBox5.Text;



                    Dictionary<string, object> options = new Dictionary<string, object>
                    {
                        { "amount", amount },
                        { "currency", "INR" },
                        { "receipt", "order_receipt_" + cartId },
                        { "payment_capture", 1 }
                    };

                    Razorpay.Api.Order order = razorpayClient.Order.Create(options);
                    string orderId = order["id"].ToString();

                    // Retrieve the text from Label1 and store it in a string variable


                    string razorpayScript = $@"
                    var options = {{
                        'key': '{keyId}',
                        'amount': '{amount}',
                        'currency': 'INR',
                        'name': 'Ecommerce Team-1',
                        'description': 'Test Payment',
                        'order_id': '{orderId}',
                        'handler': function(response) {{
                            alert('Payment successful. Payment ID: ' + response.razorpay_payment_id);
                        }},
                        'prefill': {{
                           'name': '{Usernamelabel}',
                            'email': '{Emaillabel}',
                            'contact': '{contact}',
                             'Pincode':'{pincode}',
                              'address':'{address}'
                           
                        }},
                        'theme': {{
                            'color': '#F37254'
                        }}
                    }};
                    var rzp1 = new Razorpay(options);
                    rzp1.open();";

                    ClientScript.RegisterStartupScript(this.GetType(), "razorpayScript", razorpayScript, true);
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions
                Response.Write($"<script>alert('Error: {ex.Message}');</script>");
            }
        }
    }
}
