using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ecommerce_masstechasp1
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["MyUser"] != null)
            {
                Label1.Text = Session["MyUser"].ToString();
            }
            else
            {
                Response.Redirect("<script>alert('You Need To Login').window.location.href='Login.aspx'</script>");
            }
            if (!IsPostBack)
            {
                int userId = int.Parse(Session["user_id"].ToString()); // Replace this with your actual method to get the user ID

                int cartCount = GetCartCount(userId);
                Label2.Text = cartCount.ToString();
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("firstpage.aspx");
        }
        public int GetCartCount(int userId)
        {
            int cartCount = 0;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM Cart WHERE user_id = @UserId";

                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@UserId", userId);
                    connection.Open();
                    //cartCount = (int)command.ExecuteScalar();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            cartCount = reader.GetInt32(0);
                            
                        }
                    }
                }
                connection.Close();
                return cartCount;
            }
       
        }
    }
}