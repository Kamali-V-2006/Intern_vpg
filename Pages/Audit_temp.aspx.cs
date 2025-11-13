using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Linq;
using System.Web.Script.Serialization;
using System;
using System.Collections.Generic;



namespace FiveS.Pages

{
    public partial class Audit_temp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadSections();
                BindTemplateTable();
                LoadQuestions();
            }
          
        }
        private void BindTemplateTable()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("TemplateID");
            dt.Columns.Add("TemplateName");
            dt.Columns.Add("CreatedBy");
            dt.Columns.Add("CreatedDate", typeof(DateTime));
            dt.Columns.Add("UpdatedDate", typeof(DateTime));

            // Dummy data
            dt.Rows.Add("T001", "Development", "Admin", DateTime.Now.AddDays(-10), DateTime.Now.AddDays(-1));
            dt.Rows.Add("T002", "Manufacturing", "Kamali", DateTime.Now.AddDays(-8), DateTime.Now.AddDays(-2));
            dt.Rows.Add("T003", "Office Area", "Vishal", DateTime.Now.AddDays(-5), DateTime.Now.AddDays(-1));
            dt.Rows.Add("T004", "Warehouse", "Harini", DateTime.Now.AddDays(-3), DateTime.Now);
            dt.Rows.Add("T005", "Maintenance", "Raj", DateTime.Now.AddDays(-1), DateTime.Now);

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        private void LoadSections()
        {
            var sections = new List<object>
            {
                new { SectionName = "Sort" },
                new { SectionName = "Set in Order" },
                new { SectionName = "Shine" },
                new { SectionName = "Standardize" },
                new { SectionName = "Sustain" }
            };

            SectionRepeater.DataSource = sections;
            SectionRepeater.DataBind();
        }

        private void LoadQuestions()
        {
            string connStr = ConfigurationManager.ConnectionStrings["FiveSConnectionString"].ConnectionString;

            DataTable dt = new DataTable();
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(@"
            SELECT SType, Question 
            FROM QuestionTable
            ORDER BY SType", conn);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
            }

            // Convert to Dictionary<string, List<string>>
            var questions = dt.AsEnumerable()
                .GroupBy(row => row.Field<string>("SType"))
                .ToDictionary(
                    g => g.Key,
                    g => g.Select(r => r.Field<string>("Question")).ToList()
                );

            hfQuestionsJSON.Value = new JavaScriptSerializer().Serialize(questions);
        }




        protected void addNewQuestion(object sender, EventArgs e)
        {
            // Read values from the HTML form
            string ques = txtQuestion.Value.Trim();

            string sValue = ddlSType.SelectedValue;

            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["FiveSConnectionString"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = @"INSERT INTO QuestionTable
                             (Question, SType, IsActive, IsDelete, CreatedDate)
                             VALUES (@ques, @sValue, 1, 0, GETDATE())";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@ques", ques);
                    cmd.Parameters.AddWithValue("@sValue", sValue);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }

                // Refresh question list
                LoadQuestions();

                Response.Write("<script>alert('✅ Question Added Successfully');</script>");

                // Clear UI fields
                txtQuestion.Value = "";
                ddlSType.SelectedIndex = 0;
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('❌ Error: " + ex.Message.Replace("'", "\\'") + "');</script>");
            }
        }


        protected void SaveTemplate(object sender, EventArgs e)
        {
            string templateName = txtAuditName.Text.Trim();

            if (string.IsNullOrEmpty(templateName))
            {
                Response.Write("<script>alert('❌ Please enter a template name');</script>");
                return;
            }

            // ✅ Safely check the hidden field
            string selectedJson = hfSelectedQuestionsJSON.Value;
            if (string.IsNullOrEmpty(selectedJson))
            {
                Response.Write("<script>alert('❌ No questions selected. Please select questions first.');</script>");
                return;
            }

            var serializer = new JavaScriptSerializer();
            var selectedQuestions = serializer.Deserialize<Dictionary<string, List<string>>>(selectedJson);
            if (selectedQuestions == null || selectedQuestions.Count == 0)
            {
                Response.Write("<script>alert('❌ No questions selected.');</script>");
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["FiveSConnectionString"].ConnectionString;

            try
            {
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();

                    foreach (var sectionEntry in selectedQuestions)
                    {
                        string sectionName = sectionEntry.Key;
                        List<string> questions = sectionEntry.Value;

                        foreach (string ques in questions)
                        {
                            SqlCommand getQuesIdCmd = new SqlCommand(
                                "SELECT QuestionID FROM QuestionTable WHERE Question=@ques AND SType=@stype", conn);
                            getQuesIdCmd.Parameters.AddWithValue("@ques", ques);
                            getQuesIdCmd.Parameters.AddWithValue("@stype", sectionName);

                            object qidObj = getQuesIdCmd.ExecuteScalar();
                            if (qidObj != null)
                            {
                                int questionId = Convert.ToInt32(qidObj);

                                SqlCommand insertCmd = new SqlCommand(@"
                            INSERT INTO TemplateTable (templateName, QuestionID, Question, SType, IsActive, IsDelete, CreatedDate)
                            VALUES (@template, @qid, @question, @stype, 1, 0, GETDATE())", conn);

                                insertCmd.Parameters.AddWithValue("@template", templateName);
                                insertCmd.Parameters.AddWithValue("@qid", questionId);
                                insertCmd.Parameters.AddWithValue("@question", ques);
                                insertCmd.Parameters.AddWithValue("@stype", sectionName);
                                insertCmd.ExecuteNonQuery();
                            }
                        }
                    }
                }

                Response.Write("<script>alert('✅ Template saved successfully');</script>");
                txtAuditName.Text = "";
                hfSelectedQuestionsJSON.Value = "";
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('❌ Error: " + ex.Message.Replace("'", "\\'") + "');</script>");
            }
        }

        protected void btnAssignConfirm_Click(object sender, EventArgs e)
        {
            string auditName = txtAuditName.Text.Trim();
            string auditor = txtAuditor.Text.Trim();
            string areaLineCell = txtAreaLineCell.Text.Trim();
            string date = txtDate.Text.Trim();

            if (string.IsNullOrEmpty(auditName) || string.IsNullOrEmpty(auditor) ||
                string.IsNullOrEmpty(areaLineCell) || string.IsNullOrEmpty(date))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please fill all fields.');", true);
                return;
            }

            // 👉 Here you can save to your database or handle logic
            // Example:
            // SaveAuditAssignment(auditName, auditor, areaLineCell, DateTime.Parse(date));

            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('✅ Audit assigned successfully!');", true);
        }



    }
}



