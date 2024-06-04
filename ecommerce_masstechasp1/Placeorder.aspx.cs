using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System.Drawing.Printing;
using System.Reflection.Emit;
using System.Xml.Linq;
using Razorpay.Api;
using System.Data;
using System.Collections;

namespace ecommerce_masstechasp1
{
    public partial class Placeorder : System.Web.UI.Page
    {
        SqlConnection conn;
        string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            Button1.Enabled = false;
            //Session["user_id"] = 1;
            conn = new SqlConnection(cnf);
            conn.Open();

            if (!IsPostBack)
            {
                FetchOrders();
                UserFetchDetails();
                CalculateTotalPrice();
            }

        }

        protected void FetchOrders()
        {
            string str = Session["user_id"].ToString();
            string username = Session["username"].ToString();
            string q = "select * from orders where user_id='" + str + "'";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            rdr.Read();
            Label1.Text = "Inv" + GenerateOrderId();
            if (Session["email"] != null)
            {
                Label2.Text = Session["email"].ToString();
                username_label.Text = username;
            }

            //Label3.Text = "959412322";
            //address_label.Text = "D-1, Nirmiti CHSL, Secor 22,vashi, Panvel , Navi Mumbai.";
        }

        protected string GenerateOrderId()
        {
            Random random = new Random();
            return random.Next(100, 999).ToString();
        }



        protected void UserFetchDetails()
        {
            int userId = Convert.ToInt32(Session["user_id"]);

            using (SqlConnection conn = new SqlConnection(cnf))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("sp_fetch_userdetails", conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@userdetails_id", userId);

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    // Process the fetched data
                    string userAddress = reader["user_address"].ToString();
                    int pincode = int.Parse(reader["pincode"].ToString());
                    int contact = Convert.ToInt32(reader["contact"]);

                    // Display the fetched data
                    address_label.Text = userAddress;
                    pincode_label.Text = pincode.ToString();
                    contact_label.Text = contact.ToString();
                }
            }
        }



        private void CalculateTotalPrice()
        {
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                using (SqlCommand command = new SqlCommand("exec CalculateTotalOrderPriceByUserID '" + Session["user_id"] + "'", connection))
                {
                    connection.Open();

                    object result = command.ExecuteScalar();
                    totalPriceLabel.Text = result.ToString();
                }
            }
        }

        protected void Download_Invoice(object sender, EventArgs e)
        {
            ///Ordered Successfully so deleted from OrderTable and Stored in Order History
            OrderToOrderHistory(Convert.ToInt32(Session["user_id"]));


            Response.ContentType = "application/pdf";

            Response.AddHeader("content-disposition", "attachment;filename=OrderInvoice.pdf");

            Response.Cache.SetCacheability(HttpCacheability.NoCache);

            StringWriter sw = new StringWriter();

            HtmlTextWriter writer = new HtmlTextWriter(sw);

            Panel1.RenderControl(writer);
            StringReader stringReader = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 101, 10f, 100f, 0f);
            HTMLWorker worker = new HTMLWorker(pdfDoc);

            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);

            pdfDoc.Open();

            worker.Parse(stringReader);

            pdfDoc.Close();

            Response.Write(pdfDoc);

            Response.End();
        }

        private void OrderToOrderHistory(int userId)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(cnf))
                {
                    using (SqlCommand cmd = new SqlCommand("EXEC OrderToOrderHistory '" + userId + "'", conn))
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("alert(" + ex + ")");
            }
        }



        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
               server control at run time. */

        }


        protected void Button3_Click(object sender, EventArgs e)
        {
            Button1.Enabled = true;
            try
            {


                string keyId = "rzp_test_UMVGiuA5sKQxEW";
                string keySecret = "mt9CiFHhiphKs5khoGENBZbB";
                RazorpayClient razorpayClient = new RazorpayClient(keyId, keySecret);
                decimal amount = Convert.ToDecimal(totalPriceLabel.Text) * 100;

                Dictionary<string, object> options = new Dictionary<string, object>
                    {
                        { "amount", amount },
                        { "currency", "INR" },
                        { "receipt", "order_receipt_" + "cartId" },
                        { "payment_capture", 1 }
                    };

                Razorpay.Api.Order order = razorpayClient.Order.Create(options);
                string orderId = order["id"].ToString();

                // Retrieve the text from Label1 and store it in a string variable


                string razorpayScript = $@"
                    var options = {{
                        'key': '{keyId}',
                        'amount': '{amount * 100}',
                        'currency': 'INR',
                        'name': 'Ecommerce Team-1',
                        'description': 'Test Payment',
                        'order_id': '{orderId}',
                        'handler': function(response) {{
                            alert('Payment successful. Payment ID: ' + response.razorpay_payment_id);
                         
                        }},
                        'prefill': {{
                           'name': '{Session["username"]}',
                            'email': '{Session["email"]}',
                            /*'contact': '{"contact"}',
                             'Pincode':'{"pincode"}',
                              'address':'{"address"}'*/
                           
                        }},
                        'theme': {{
                            'color': '#F37254'
                        }}
                    }};
                    var rzp1 = new Razorpay(options);
                    rzp1.open();";

                ClientScript.RegisterStartupScript(this.GetType(), "razorpayScript", razorpayScript, true);
            }
            catch (Exception ex)
            {
                // Handle exceptions
                Response.Write($"<script>alert('Error: {ex.Message}');</script>");
            }
        }

    }
}