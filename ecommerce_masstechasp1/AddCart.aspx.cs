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




    }
}