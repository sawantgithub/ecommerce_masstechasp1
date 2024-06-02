using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ecommerce_masstechasp1
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string conf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(conf);
            conn.Open();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string user = TextBox1.Text, pass = TextBox2.Text;
            string q = "exec AuthLoginProc '" + user + "','" + pass + "'";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {

                while (reader.Read())
                {
                    if ((reader["username"].Equals(user) || reader["email"].Equals(user)) && reader["passkey"].Equals(pass) && reader["urole"].ToString().Equals("Admin"))
                    {
                        Session["MyUser"] = user;

                        Response.Redirect("Admin.aspx");
                    }
                    else  if ((reader["username"].Equals(user) || reader["email"].Equals(user)) && reader["passKey"].Equals(pass) && reader["urole"].ToString().Equals("User"))
                    {
                        Session["MyUser"] = user;
                        Session["user_id"] = reader["user_id"];
                        Session["username"] = reader["username"];
                        Session["email"] = reader["email"];
                        Response.Redirect("User.aspx");
                    }

                }
                reader.Close();
            }
            else
            {
                Response.Write("<script>alert('First Register')</script>");

            }

        }
    }
}