using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System;

namespace ecommerce_masstechasp1
{
    public partial class UserHome : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
        private int userId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["user_id"] != null)
                {
                    userId = Convert.ToInt32(Session["user_id"]);
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
           
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("Exec CartToOrderByUser '" + Convert.ToInt32(Session["user_id"]) + "'", con))
                {
                    con.Open();
                    cmd.ExecuteNonQuery();

                }
                LoadCartDetails();
            }
            Response.Redirect("Order.aspx");

        }
    }
}