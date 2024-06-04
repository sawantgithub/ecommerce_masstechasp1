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
                // Add your code to remove the item from the order using the orderId
                // For example, you can call a stored procedure to delete the order
                // Then rebind the GridView to refresh the items
                // db.DeleteOrder(orderId); e// Example function call
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand("exec DeleteOrder  '" +  orderId+ "'", connection))
                    {
                        /*command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.AddWithValue("@user_id", userId);*/

                        connection.Open();

                        object result = command.ExecuteScalar();
                        //totalPriceLabel.Text = result.ToString();
                        //totalPriceLabel.Text = int.Parse(result);
                    }

                }


                BindGridView();
            }
        }


        /*private decimal CalculateTotalPrice()
        {
            decimal totalPrice = 0m;

            foreach (GridViewRow row in GridView1.Rows)
            {
                Label priceLabel = (Label)row.FindControl("price");
                if (priceLabel != null)
                {
                    decimal price;
                    if (decimal.TryParse(priceLabel.Text, out price))
                    {
                        totalPrice += price;
                    }
                }
            }

            totalPriceLabel.Text = "Total Price: " + totalPrice.ToString("C");
            return totalPrice;
        }*/

        private void CalculateTotalPrice()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("exec CalculateTotalOrderPriceByUserID '" + Session["user_id"] + "'", connection))
                {
                    /*command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@user_id", userId);*/

                    connection.Open();

                    object result = command.ExecuteScalar();
                    totalPriceLabel.Text = result.ToString();
                    //totalPriceLabel.Text = int.Parse(result);
                }
            }
        }


        protected void BuyNowButton_Click(object sender, EventArgs e)
        {
            BindGridView();

            Response.Redirect("Placeorder.aspx");
        }
    }
}
