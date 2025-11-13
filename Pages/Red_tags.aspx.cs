using System;
using System.IO;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace FiveS.Pages
{
    public partial class Red_tags : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            byte[] photoBytes = null;
            string uploadedFileName = "";

            // ✅ Handle File Upload
            if (FileUpload1.HasFile)
            {
                string folderPath = Server.MapPath("~/Uploads/");
                if (!Directory.Exists(folderPath))
                    Directory.CreateDirectory(folderPath);

                uploadedFileName = Path.GetFileName(FileUpload1.FileName);
                string filePath = Path.Combine(folderPath, uploadedFileName);

                // Save file to server
                FileUpload1.SaveAs(filePath);

                // Convert file to byte array
                using (BinaryReader br = new BinaryReader(FileUpload1.PostedFile.InputStream))
                {
                    photoBytes = br.ReadBytes(FileUpload1.PostedFile.ContentLength);
                }

                lblFileName.Text = "Uploaded: " + uploadedFileName;
                lblFileName.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                Response.Write("<script>alert('⚠️ Please upload an image before saving.');</script>");
                return;
            }

            // ✅ Collect Form Inputs
            string Item = txtItem.Text.Trim();
            string Zone = ddlZone.SelectedValue.Trim();
            string Type = ddlType.SelectedValue.Trim();
            string Owner = txtOwner.Text.Trim();
            string Notes = txtNotes.Text.Trim();

            // ✅ Validation
            if (string.IsNullOrWhiteSpace(Item) ||
                string.IsNullOrWhiteSpace(Zone) ||
                string.IsNullOrWhiteSpace(Type) ||
                string.IsNullOrWhiteSpace(Owner) ||
                string.IsNullOrWhiteSpace(Notes))
            {
                Response.Write("<script>alert('⚠️ Please fill all fields before submitting.');</script>");
                return;
            }

            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["FiveSConnectionString"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = @"INSERT INTO Red_Tags
                                    (Item, Zone, Type, Owner, Notes, Image, CreatedDate)
                                     VALUES (@Item, @Zone, @Type, @Owner, @Notes, @Image, GETDATE())";

                    SqlCommand cmd = new SqlCommand(query, conn);

                    cmd.Parameters.AddWithValue("@Item", Item);
                    cmd.Parameters.AddWithValue("@Zone", Zone);
                    cmd.Parameters.AddWithValue("@Type", Type);
                    cmd.Parameters.AddWithValue("@Owner", Owner);
                    cmd.Parameters.AddWithValue("@Notes", Notes);

                    // ✅ Store image bytes safely
                    if (photoBytes != null)
                        cmd.Parameters.Add("@Image", SqlDbType.Image).Value = photoBytes;
                    else
                        cmd.Parameters.Add("@Image", SqlDbType.Image).Value = DBNull.Value;

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }

                // ✅ Success message
                Response.Write("<script>alert('✅ Red Tag saved successfully!');</script>");

                // ✅ Reset form
                txtItem.Text = "";
                ddlZone.ClearSelection();
                ddlType.ClearSelection();
                txtOwner.Text = "";
                txtNotes.Text = "";
                lblFileName.Text = "";
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('❌ Error: " + ex.Message.Replace("'", "") + "');</script>");
            }
        }
    }
}
