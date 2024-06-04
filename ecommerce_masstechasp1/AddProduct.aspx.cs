using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ecommerce_masstechasp1
{
    public partial class AddProduct : System.Web.UI.Page
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
            string productName = TextBox1.Text;
            string categories = TextBox2.Text;
            decimal price;
            int quantity;

            // Validate price and quantity inputs
            if (!decimal.TryParse(TextBox3.Text, out price))
            {
                lblMessage.Text = "Invalid price.";
                lblMessage.CssClass = "text-danger";
                return;
            }

            if (!int.TryParse(TextBox4.Text, out quantity))
            {
                lblMessage.Text = "Invalid quantity.";
                lblMessage.CssClass = "text-danger";
                return;
            }

            string productImg = "";

            // Handle file upload
            if (FileUpload1.HasFile)
            {
                try
                {
                    string filename = Path.GetFileName(FileUpload1.FileName);
                    string filePath = Server.MapPath("ProductImages/") + filename;
                    FileUpload1.SaveAs(filePath);
                    productImg = "ProductImages/" + filename;
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "File upload failed: " + ex.Message;
                    lblMessage.CssClass = "text-danger";
                    return;
                }
            }

            // Insert data into database
            string connectionString = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            string query = @"
                INSERT INTO products (product_name, categories, price, product_img, quantity)
                VALUES (@ProductName, @Categories, @Price, @ProductImg, @Quantity)";


            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@ProductName", productName);
                        cmd.Parameters.AddWithValue("@Categories", categories);
                        cmd.Parameters.AddWithValue("@Price", price);
                        cmd.Parameters.AddWithValue("@ProductImg", productImg);
                        cmd.Parameters.AddWithValue("@Quantity", quantity);

                        conn.Open();
                        cmd.ExecuteNonQuery();
                        lblMessage.Text = "Product added successfully!";
                        lblMessage.CssClass = "text-success";
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
                lblMessage.CssClass = "text-danger";
            }
        
    }
    }
}