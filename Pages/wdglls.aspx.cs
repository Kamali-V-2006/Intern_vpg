using System;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace FiveS.Pages
{
    public partial class wdglls : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            // --- Validate Required Fields ---
            if (string.IsNullOrWhiteSpace(txtTitle.Text) ||
                string.IsNullOrWhiteSpace(txtChecklist.Text))
            {
                lblMessage.Text = "⚠️ Please fill all fields before saving.";
                lblMessage.CssClass = "text-warning fw-bold";
                return;
            }

            // --- Convert Uploaded Image to Bytes (if available) ---
            byte[] photoBytes = null;

            if (FileUpload1.HasFile)
            {
                using (BinaryReader br = new BinaryReader(FileUpload1.PostedFile.InputStream))
                {
                    photoBytes = br.ReadBytes(FileUpload1.PostedFile.ContentLength);
                }
            }
            else
            {
                lblMessage.Text = "⚠️ Please upload a photo or capture an image.";
                lblMessage.CssClass = "text-warning fw-bold";
                return;
            }

            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["FiveSConnectionString"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = @"INSERT INTO wdgll_table (Title, Site, Zone, Checkpoints, Photo)
                                     VALUES (@Title, @Site, @Zone, @Checkpoints, @Photo)";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@Title", txtTitle.Text.Trim());
                    cmd.Parameters.AddWithValue("@Site", ddlSite.SelectedValue);
                    cmd.Parameters.AddWithValue("@Zone", ddlZone.SelectedValue);
                    cmd.Parameters.AddWithValue("@Checkpoints", txtChecklist.Text.Trim());
                    cmd.Parameters.Add("@Photo", SqlDbType.Image).Value = photoBytes;

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }

                lblMessage.Text = "✅ WDGLL Standard Saved Successfully!";
                lblMessage.CssClass = "text-success fw-bold";

                // Clear fields
                txtTitle.Text = "";
                txtChecklist.Text = "";
                lblFileName.Text = "";
            }
            catch (Exception ex)
            {
                lblMessage.Text = "❌ Error: " + ex.Message;
                lblMessage.CssClass = "text-danger fw-bold";
            }
        }
    }
}
