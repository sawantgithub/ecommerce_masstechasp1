﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ecommerce_masstechasp1
{
    public partial class Admin : System.Web.UI.MasterPage
    {
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
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("firstpage.aspx");

        }
    }
}