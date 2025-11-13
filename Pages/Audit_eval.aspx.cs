using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Data;


namespace FiveS.Pages
{
    public partial class Audit_eval : System.Web.UI.Page

    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["FiveSConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRepeaters();
                ddlExistingQuestions.Items.Clear();
                ddlExistingQuestions.Items.Add(new System.Web.UI.WebControls.ListItem("-- Select a Question or Type Below --", ""));

            }
        }
        protected void ddlChoosenS_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedS = ddlChoosenS.SelectedValue;

            if (!string.IsNullOrEmpty(selectedS))
            {
                BindQuestions(selectedS);
            }
        }

        private void BindQuestions(string sType)
        {
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["FiveSConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connStr))
                using (SqlCommand cmd = new SqlCommand("SELECT QuestionID, Question FROM QuestionTable WHERE SType = @SType", con))
                {
                    cmd.Parameters.AddWithValue("@SType", sType);
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();

                    ddlExistingQuestions.DataSource = dr;
                    ddlExistingQuestions.DataTextField = "Question";
                    ddlExistingQuestions.DataValueField = "QuestionID";
                    ddlExistingQuestions.DataBind();
                    con.Close();

                    ddlExistingQuestions.Items.Insert(0, new System.Web.UI.WebControls.ListItem("-- Select a Question or Type Below --", ""));
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('❌ Error while fetching questions: " + ex.Message.Replace("'", "\\'") + "');</script>");
            }
        }



        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string auditName = txtAuditName.Text.Trim();
            string auditor = txtAuditor.Text.Trim();
            string area = txtArea.Text.Trim();
            string date = txtDate.Text.Trim();

            if (string.IsNullOrWhiteSpace(auditName) ||
                string.IsNullOrWhiteSpace(auditor) ||
                string.IsNullOrWhiteSpace(area) ||
                string.IsNullOrWhiteSpace(date))
            {
                Response.Write("<script>alert('⚠️ Please fill all fields before submitting.');</script>");
                return;
            }

            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["FiveSConnectionString"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = @"INSERT INTO Audit_Details
                                     (AuditName, AuditArea, AuditorName, Date, IsActive, IsDelete, CreatedDate)
                                     VALUES (@AuditName, @AuditArea, @AuditorName, @Date, 1, 0, GETDATE())";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@AuditName", auditName);
                    cmd.Parameters.AddWithValue("@AuditArea", area);
                    cmd.Parameters.AddWithValue("@AuditorName", auditor);
                    cmd.Parameters.AddWithValue("@Date", Convert.ToDateTime(date));

                    conn.Open();
                    int rows = cmd.ExecuteNonQuery();

                    if (rows > 0)
                        Response.Write("<script>alert('✅ Audit details inserted successfully.');</script>");
                    else
                        Response.Write("<script>alert('⚠️ No record inserted.');</script>");
                }

                // Clear fields after successful insert
                txtAuditName.Text = "";
                txtAuditor.Text = "";
                txtArea.Text = "";
                txtDate.Text = "";
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('❌ Error: " + ex.Message.Replace("'", "\\'") + "');</script>");
            }
        }
        protected void btnAddQuestion_Click(object sender, EventArgs e)
        {
            // Read values from dropdown and textbox
            string selectedQuestion = ddlExistingQuestions.SelectedItem != null ? ddlExistingQuestions.SelectedItem.Text.Trim() : "";
            string typedQuestion = txtQuestion.Text.Trim();
            string sValue = ddlChoosenS.SelectedValue;

            // Determine which question to insert (prefer typed if given)
            string finalQuestion = !string.IsNullOrEmpty(typedQuestion) ? typedQuestion : selectedQuestion;

            if (string.IsNullOrEmpty(finalQuestion))
            {
                Response.Write("<script>alert('⚠️ Please select or enter a question.');</script>");
                return;
            }

            if (string.IsNullOrEmpty(sValue))
            {
                Response.Write("<script>alert('⚠️ Please select an S type.');</script>");
                return;
            }

            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["FiveSConnectionString"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = @"INSERT INTO Create_audit
                             (Question, ChoosenS, IsActive, IsDelete)
                             VALUES 
                             (@Question, @ChoosenS, 1, 0)";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@Question", finalQuestion);
                    cmd.Parameters.AddWithValue("@ChoosenS", sValue);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }

                // Refresh repeater to show new question
                BindRepeaters();

                Response.Write("<script>alert('✅ Question added successfully!');</script>");

                // Clear form fields
                ddlChoosenS.SelectedIndex = 0;
                ddlExistingQuestions.Items.Clear();
                ddlExistingQuestions.Items.Add(new System.Web.UI.WebControls.ListItem("-- Select a Question or Type Below --", ""));
                txtQuestion.Text = "";
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('❌ Error: " + ex.Message.Replace("'", "\\'") + "');</script>");
            }
        }


        private void BindRepeaters()
        {
            string connStr = ConfigurationManager.ConnectionStrings["FiveSConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                // Sort (Seiri)
                using (SqlDataAdapter da = new SqlDataAdapter("SELECT Question FROM Create_audit WHERE ChoosenS = 'sort' AND IsDelete = 0 AND IsActive = 1", conn))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    rptSort.DataSource = dt;
                    rptSort.DataBind();
                }

                // Set in Order (Seiton)
                using (SqlDataAdapter da = new SqlDataAdapter("SELECT Question FROM Create_audit WHERE ChoosenS = 'set in order' AND IsDelete = 0 AND IsActive = 1", conn))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    rptSetInOrder.DataSource = dt;
                    rptSetInOrder.DataBind();
                }

                // Shine (Seiso)
                using (SqlDataAdapter da = new SqlDataAdapter("SELECT Question FROM Create_audit WHERE ChoosenS = 'shine' AND IsDelete = 0 AND IsActive = 1", conn))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    rptShine.DataSource = dt;
                    rptShine.DataBind();
                }

                // Standardize (Seiketsu)
                using (SqlDataAdapter da = new SqlDataAdapter("SELECT Question FROM Create_audit WHERE ChoosenS = 'standardize' AND IsDelete = 0 AND IsActive = 1", conn))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    rptStandardize.DataSource = dt;
                    rptStandardize.DataBind();
                }

                // Sustain (Shitsuke)
                using (SqlDataAdapter da = new SqlDataAdapter("SELECT Question FROM Create_audit WHERE ChoosenS = 'sustain' AND IsDelete = 0 AND IsActive = 1", conn))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    rptSustain.DataSource = dt;
                    rptSustain.DataBind();
                }
            }
        }





    }
}
