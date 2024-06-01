using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Net;

namespace ecommerce_masstechasp1
{
    public partial class User : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        //{
        //    if (e.CommandName == "SelectItem")
        //    {
        //        // Retrieve the item ID from CommandArgument
        //        string itemId = e.CommandArgument.ToString();
        //        Response.Redirect(<Script></script>)
        //        // Find the data item using the item ID (for demonstration, using GetData method)
        //        //var dataItem = FindDataItem(itemId);

        //        //if (dataItem != null)
        //        //{
        //        //    // Display selected item details in the label
        //        //    //SelectedItemLabel.Text = "Selected Item: " + dataItem.ItemName;
        //        //}
        //    }
        //}
        protected void On_click(object sender, EventArgs e)
        {
            //Button btn = sender as Button;
            //Session["product_id"] = btn.CommandArgument.ToString();
            //Response.Redirect("AddCart.aspx");
            Button btn = sender as Button;
            int productId = int.Parse(btn.CommandArgument.ToString());
            int userId = int.Parse(Session["user_id"].ToString()); // Assuming user_id is stored in session
            int quantity = 1; // Example quantity, modify as needed

            AddToCart(userId, productId, quantity);

            // Redirect to cart page or display a success message
            Response.Redirect("AddCart.aspx");
        }

        private void AddToCart(int userId, int productId, int quantity)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("AddToCart", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@userId", userId);
                    cmd.Parameters.AddWithValue("@productId", productId);
                    cmd.Parameters.AddWithValue("@quantity", quantity);
                    
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }


    }

}