using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace FiveS.Pages
{
    public partial class Wdgll_tab : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindWDGLLTable();
            }
        }

        private void BindWDGLLTable()
        {
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["FiveSConnectionString"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = @"SELECT wdgllId, title, site, zone, checkpoints, photo FROM wdgll_table";
                    SqlDataAdapter da = new SqlDataAdapter(query, conn);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    // 🧠 Convert binary to Base64 for direct use
                    dt.Columns.Add("ImageBase64", typeof(string));
                    foreach (DataRow row in dt.Rows)
                    {
                        if (row["photo"] != DBNull.Value)
                        {
                            byte[] imgBytes = (byte[])row["photo"];
                            string base64 = Convert.ToBase64String(imgBytes);
                            row["ImageBase64"] = "data:image/jpeg;base64," + base64;
                        }
                        else
                        {
                            row["ImageBase64"] = "";
                        }
                    }

                    RepeaterWDGLL.DataSource = dt;
                    RepeaterWDGLL.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('❌ Error: " + ex.Message.Replace("'", "\\'") + "');</script>");
            }
        }
    }
}
