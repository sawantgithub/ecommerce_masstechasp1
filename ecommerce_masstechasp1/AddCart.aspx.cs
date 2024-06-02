//using System;
//using System.Collections.Generic;
//using System.Configuration;
//using System.Data.SqlClient;
//using System.Data;
//using System.Linq;
//using System.Reflection.Emit;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;

//namespace ecommerce_masstechasp1
//{
//    public partial class UserHome : System.Web.UI.Page
//    {
//        private string connectionString = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
//        protected void Page_Load(object sender, EventArgs e)
//        {
//            //if (Session["Product_id"] != null)
//            //{
//            //    Label2.Text = Session["product_id"].ToString();
//            //}
//            //else
//            //{
//            //    Response.Redirect("<script>alert('You Need To Login').window.location.href='Login.aspx'</script>");
//            //}
//            if (!IsPostBack)
//            {
//                if (Session["user_id"] != null)
//                {
//                    int userId = int.Parse(Session["user_id"].ToString());
//                    LoadCartDetails(userId);
//                }
//            }
//        }

//        private void LoadCartDetails(int userId)
//        {
//            using (SqlConnection con = new SqlConnection(connectionString))
//            {
//                string query = "SELECT c.product_id, p.product_name, p.categories, p.price, c.product_img, c.quantity " +
//                               "FROM Cart c " +
//                               "JOIN products p ON c.product_id = p.product_id " +
//                               "WHERE c.user_id = @userId";

//                using (SqlCommand cmd = new SqlCommand(query, con))
//                {
//                    cmd.Parameters.AddWithValue("@userId", userId);
//                    con.Open();
//                    using (SqlDataReader reader = cmd.ExecuteReader())
//                    {
//                        DataTable dt = new DataTable();
//                        dt.Load(reader);
//                        GridView1.DataSource = dt;
//                        GridView1.DataBind();
//                    }
//                    con.Close();
//                }
//            }
//        }




//    }
//}


using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ecommerce_masstechasp1
{
    public partial class UserHome : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
        private int userId;
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["Product_id"] != null)
            //{
            //    Label2.Text = Session["product_id"].ToString();
            //}
            //else
            //{
            //    Response.Redirect("<script>alert('You Need To Login').window.location.href='Login.aspx'</script>");
            //}
            if (!IsPostBack)
            {
                if (Session["user_id"] != null)
                {
                    userId = int.Parse(Session["user_id"].ToString());
                    LoadCartDetails();
                }
            }
        }

        private void LoadCartDetails()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "EXEC FetchCart @userId";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@userId", userId);
                    con.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        DataTable dt = new DataTable();
                        dt.Load(reader);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                    con.Close();
                }
            }
        }



        protected void onDataListChange(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "IncreaseQt")
            {
                // Retrieve the item ID from CommandArgument
                string itemId = e.CommandArgument.ToString();

                // Access the Label control inside the DataList item
                Label QuantityLabel = (Label)e.Item.FindControl("QuantityLabel");
                if (int.Parse(QuantityLabel.Text) != 10)
                {
                    QuantityLabel.Text = (int.Parse(QuantityLabel.Text) + 1).ToString();
                }

            }
            else if (e.CommandName == "DecreaseQt")
            {
                // Retrieve the item ID from CommandArgument
                string itemId = e.CommandArgument.ToString();

                // Access the Label control inside the DataList item
                Label QuantityLabel = (Label)e.Item.FindControl("QuantityLabel");
                if (int.Parse(QuantityLabel.Text) != 1)
                {
                    QuantityLabel.Text = (int.Parse(QuantityLabel.Text) - 1).ToString();
                }
            }
        }


        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            LoadCartDetails();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            int productId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            string productName = (row.Cells[2].Controls[0] as TextBox).Text;
            string categories = (row.Cells[3].Controls[0] as TextBox).Text;
            decimal price = Convert.ToDecimal((row.Cells[4].Controls[0] as TextBox).Text);
            int cartQuantity = Convert.ToInt32((row.Cells[5].Controls[0] as TextBox).Text);

            string connectionString = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("UpdateProduct", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@product_id", productId);
                    cmd.Parameters.AddWithValue("@product_name", productName);
                    cmd.Parameters.AddWithValue("@categories", categories);
                    cmd.Parameters.AddWithValue("@price", price);
                    cmd.Parameters.AddWithValue("@quantity", cartQuantity);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            GridView1.EditIndex = -1;
            LoadCartDetails();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            LoadCartDetails();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int cartId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);

            string connectionString = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("DeleteCart", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@cartId", cartId);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    
                }
                LoadCartDetails();

            }
            
            Response.Redirect(Request.RawUrl);

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "SelectCart")
            {
                int cartId = Convert.ToInt32(e.CommandArgument);
                // Handle the cart_id click event here
                // For example, you can redirect to another page or display details
                Response.Write("Cart ID clicked: " + cartId);
            }
            else if (e.CommandName == "buynow")
            {
                int cartId = Convert.ToInt32(e.CommandArgument);
                Session["CartToOrder"] = cartId;
                Response.Redirect("Order.aspx");
            }
        }


    }
}