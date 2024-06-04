using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using Razorpay.Api;

namespace ecommerce_masstechasp1
{
    public partial class Order : Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
                CalculateTotalPrice();
            }
        }

        private void BindGridView()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("GetOrderDetailsByUserID", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@user_id", Session["user_id"]);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }
        }

        protected void RemoveButton_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Remove")
            {
                int orderId = Convert.ToInt32(e.CommandArgument);
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand("exec DeleteOrder  '" + orderId + "'", connection))
                    {
                        connection.Open();
                        command.ExecuteScalar();
                        BindGridView();
                    }

                }
            }
        }

        private void CalculateTotalPrice()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("exec CalculateTotalOrderPriceByUserID '" + Session["user_id"] + "'", connection))
                {
                    connection.Open();

                    object result = command.ExecuteScalar();
                    totalPriceLabel.Text = result.ToString();
                }
            }
        }


        protected void BuyNowButton_Click(object sender, EventArgs e)
        {
            try
            {
                int userId = Convert.ToInt32(Session["user_id"]);
                string userAddress = address_label.Text;
                int pincode = int.Parse(pincode_label.Text);
                decimal contact = decimal.Parse(contact_label.Text);

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string query = $"EXEC sp_insert_userdetails '{userId}',{userAddress},{pincode},{contact}";
                    SqlCommand cmd = new SqlCommand(query, conn);

                    cmd.ExecuteNonQuery();
                }

                //BindGridView();
                Response.Redirect("Placeorder.aspx");
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Error: {ex.Message}');</script>");
            }
        }
    }
}