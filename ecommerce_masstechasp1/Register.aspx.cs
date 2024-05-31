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
    public partial class Register : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string conf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(conf);
            conn.Open();
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {

            string name = TextBox1.Text, pass = TextBox2.Text,email = txtEmail.Text;
            string q = "exec AuthReg '" + name + "','" + email + "','"+pass+"'";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.ExecuteNonQuery();
            reset();
            Response.Write("<script>alert('Your Registration is Successfully');</script>");

            //Session["name"] = TextBox1.Text;
            Response.Redirect("Login.aspx");
            conn.Close();
        }


        public void reset()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";

        }
    }
}