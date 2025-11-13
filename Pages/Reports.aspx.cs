using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FiveS.Pages
{
    public partial class Reports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                BindGrid();
        }

        private void BindGrid(string search = "")
        {
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[]
            {
                new DataColumn("AuditID", typeof(int)),
                new DataColumn("AuditName"),
                new DataColumn("AuditorName"),
                new DataColumn("DateOfAudit", typeof(DateTime)),
                new DataColumn("Area"),
                new DataColumn("Score"),
                new DataColumn("RedTags"),
                new DataColumn("WDGLL")
            });

            dt.Rows.Add(101, "Sort Evaluation", "Sankar", DateTime.Parse("2025-09-01"), "Cell-10", "85%", "3", "Good labeling");
            dt.Rows.Add(102, "Set in Order", "Karthick", DateTime.Parse("2025-09-02"), "Cell-11", "90%", "1", "Improved layout");
            dt.Rows.Add(103, "Shine Area 5", "Priya", DateTime.Parse("2025-09-03"), "Cell-12", "92%", "0", "Clean & organized");
            dt.Rows.Add(104, "Standardize Tools", "Rahul", DateTime.Parse("2025-09-04"), "Cell-7", "88%", "2", "Need better SOP");
            dt.Rows.Add(105, "Sustain Audit", "Sneha", DateTime.Parse("2025-09-05"), "Cell-5", "95%", "0", "Well maintained");
            dt.Rows.Add(106, "Weekly Sort", "Vijay", DateTime.Parse("2025-09-06"), "Cell-9", "89%", "1", "Arranged properly");
            dt.Rows.Add(107, "Monthly Shine", "Anitha", DateTime.Parse("2025-09-07"), "Cell-3", "93%", "0", "Excellent results");
            dt.Rows.Add(108, "Tool Arrangement", "Deepak", DateTime.Parse("2025-09-08"), "Cell-8", "84%", "2", "Minor clutter");
            dt.Rows.Add(109, "Red Tag Area", "Divya", DateTime.Parse("2025-09-09"), "Cell-4", "91%", "4", "To be reviewed");
            dt.Rows.Add(110, "Final Audit", "Pradeep", DateTime.Parse("2025-09-10"), "Cell-6", "97%", "0", "Excellent consistency");

            if (!string.IsNullOrWhiteSpace(search))
            {
                string filter = $"AuditName LIKE '%{search}%' OR AuditorName LIKE '%{search}%' OR Area LIKE '%{search}%' OR WDGLL LIKE '%{search}%'";
                DataRow[] rows = dt.Select(filter);
                dt = rows.Length > 0 ? rows.CopyToDataTable() : dt.Clone();
            }

            gvAuditReports.DataSource = dt;
            gvAuditReports.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchValue = txtSearch.Text.Trim();
            BindGrid(searchValue);
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            BindGrid();
        }
    }
}
