using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Testing
{
    public partial class ImageTesting : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProfileImage();
            }
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (fileUpload.HasFile)
            {
                // Convert the uploaded file to a byte array
                byte[] imageBytes;
                using (BinaryReader reader = new BinaryReader(fileUpload.PostedFile.InputStream))
                {
                    imageBytes = reader.ReadBytes(fileUpload.PostedFile.ContentLength);
                }

                // Save the byte array to the database
                string connectionString = ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "UPDATE ImageTesting SET ImageData = @ImageUrl WHERE Id = @Id";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@Id", 1); // Replace with the actual user ID
                    command.Parameters.AddWithValue("@ImageUrl", imageBytes);

                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }

                // Display the uploaded image
                imgProfile.ImageUrl = "data:image/png;base64," + Convert.ToBase64String(imageBytes);
            }
        }

        private void LoadProfileImage()
        {

            // Retrieve the image byte array from the database
            byte[] imageBytes = null;
            string connectionString = ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT ImageData FROM ImageTesting WHERE Id = @Id";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Id", 1); // Replace with the actual user ID

                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read() && !reader.IsDBNull(0))
                {
                    imageBytes = (byte[])reader["ImageData"];
                }
                connection.Close();
            }

            // Display the retrieved image
            if (imageBytes != null)
            {
                imgProfile.ImageUrl = "data:image/png;base64," + Convert.ToBase64String(imageBytes);
            }
            else
            {
                imgProfile.ImageUrl = "~/images/rabbit.jpg"; // Default image path
            }
            //if (Session["ProfileImage"] != null)
            //{
            //    imgProfile.ImageUrl = Session["ProfileImage"].ToString();
            //}
            //else
            //{
            //    imgProfile.ImageUrl = "~/images/rabbit.jpg"; // Default image path
            //}
        }
    }
}