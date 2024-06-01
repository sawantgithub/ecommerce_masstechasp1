using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ecommerce_masstechasp1
{
    public partial class UserHome : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
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
                    int userId = int.Parse(Session["user_id"].ToString());
                    LoadCartDetails(userId);
                }
            }
        }


        private void LoadCartDetails(int userId)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT c.product_id, p.product_name, p.categories, p.price, c.product_img, c.quantity " +
                               "FROM Cart c " +
                               "JOIN products p ON c.product_id = p.product_id " +
                               "WHERE c.user_id = @userId";

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


        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            LoadCartDetails(int.Parse(Session["user_id"].ToString()));
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            int productId = int.Parse(GridView1.DataKeys[e.RowIndex].Values[0].ToString());
            int quantity = int.Parse((row.Cells[5].Controls[0] as TextBox).Text);

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "UPDATE Cart SET quantity = @quantity WHERE product_id = @productId AND user_id = @userId";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@quantity", quantity);
                    cmd.Parameters.AddWithValue("@productId", productId);
                    cmd.Parameters.AddWithValue("@userId", int.Parse(Session["user_id"].ToString()));

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            GridView1.EditIndex = -1;
            LoadCartDetails(int.Parse(Session["user_id"].ToString()));
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            LoadCartDetails(int.Parse(Session["user_id"].ToString()));
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int productId = int.Parse(GridView1.DataKeys[e.RowIndex].Values[0].ToString());

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM Cart WHERE product_id = @productId AND user_id = @userId";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@productId", productId);
                    cmd.Parameters.AddWithValue("@userId", int.Parse(Session["user_id"].ToString()));

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            LoadCartDetails(int.Parse(Session["user_id"].ToString()));
        }

    }
}