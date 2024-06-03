using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System.Drawing.Printing;
using System.Reflection.Emit;
using System.Xml.Linq;

namespace ecommerce_masstechasp1
{
    public partial class Placeorder : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {

            Session["user_id"] = 1;
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();

            FetchOrders();
        }

        protected void FetchOrders()
        {
            string str = Session["user_id"].ToString();
            string q = "select * from orders where user_id='" + str + "'";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            rdr.Read();
             Label1.Text = "Inv" + GenerateOrderId();
            Label2.Text = Session["email"].ToString();
            Label3.Text = "959412322";
            Label4.Text = "D-1, Nirmiti CHSL, Secor 22,vashi, Panvel , Navi Mumbai.";
        }

        protected string GenerateOrderId()
        {
            Random random = new Random();
            return random.Next(100, 999).ToString();


        }

        protected void GrandTotal()
        {
            grandtotal.Text = "9090";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.ContentType = "application/pdf";

            Response.AddHeader("content-disposition", "attachment;filename=OrderInvoice.pdf");

            Response.Cache.SetCacheability(HttpCacheability.NoCache);

            StringWriter sw = new StringWriter();

            HtmlTextWriter writer = new HtmlTextWriter(sw);

            Panel1.RenderControl(writer);
            StringReader stringReader = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 101, 10f, 100f, 0f);
            HTMLWorker worker = new HTMLWorker(pdfDoc);

            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);

            pdfDoc.Open();

            worker.Parse(stringReader);

            pdfDoc.Close();

            Response.Write(pdfDoc);

            Response.End();
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
               server control at run time. */
        }

    }
}