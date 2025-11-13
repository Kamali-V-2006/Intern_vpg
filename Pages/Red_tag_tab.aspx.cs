using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace FiveS.Pages
{
    public partial class Red_tag_tab : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRedTagTable();
            }
        }

        private void BindRedTagTable()
        {
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["FiveSConnectionString"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = @"SELECT 
                                RedTagTableID, 
                                Item, 
                                Zone, 
                                Owner, 
                                Type, 
                                Notes,
                                Image
                             FROM Red_tags
                             WHERE (IsDelete IS NULL OR IsDelete = 0)
                             ORDER BY RedTagTableID ASC";

                    SqlDataAdapter da = new SqlDataAdapter(query, conn);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    // 🧠 Convert binary (varbinary) to Base64 for display
                    dt.Columns.Add("ImageBase64", typeof(string));

                    foreach (DataRow row in dt.Rows)
                    {
                        if (row["Image"] != DBNull.Value)
                        {
                            byte[] imgBytes = (byte[])row["Image"];
                            string base64 = Convert.ToBase64String(imgBytes);
                            row["ImageBase64"] = "data:image/png;base64," + base64;
                        }
                        else
                        {
                            row["ImageBase64"] = ""; // no image
                        }
                    }

                    RepeaterRedTags.DataSource = dt;
                    RepeaterRedTags.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('❌ Error: " + ex.Message.Replace("'", "\\'") + "');</script>");
            }
        }

    }
}
