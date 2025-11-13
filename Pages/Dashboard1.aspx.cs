
using System;
using System.Collections.Generic;
using System.Web.Script.Serialization;

namespace FiveS.Pages
{
    public partial class Dashboard1 : System.Web.UI.Page
    {
        public string RedTagDataJSON;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUpcomingAudits();
                LoadCompletedAudits();

                // Dummy site data
                lblSiteName.Text = "Plant A • Packaging";
                lblSiteScore.Text = "88";
                lblPerformance.Text = "Excellent";

                // Dummy red tag data for chart
                var redTagData = new
                {
                    labels = new[] { "Jan", "Feb", "Mar", "Apr", "May" },
                    values = new[] { 5, 3, 8, 4, 2 }
                };

                JavaScriptSerializer js = new JavaScriptSerializer();
                RedTagDataJSON = js.Serialize(redTagData);
            }
        }

        private void LoadUpcomingAudits()
        {
            var upcoming = new List<AuditItem>
            {
                new AuditItem { Date = "30 Oct", Type = "Weekly – Assembly" },
                new AuditItem { Date = "2 Nov", Type = "Deep Dive – QA Lab" },
                new AuditItem { Date = "4 Nov", Type = "Monthly – Packaging" },
                new AuditItem { Date = "6 Nov", Type = "Spot – Maintenance" },
                new AuditItem { Date = "8 Nov", Type = "Internal – HR Dept" }
            };

            UpcomingRepeater.DataSource = upcoming;
            UpcomingRepeater.DataBind();
        }

        private void LoadCompletedAudits()
        {
            var completed = new List<AuditItem>
            {
                new AuditItem { Date = "23 Oct", Type = "Weekly – Warehouse", Score = 91 },
                new AuditItem { Date = "25 Oct", Type = "Spot – QA Lab", Score = 85 },
                new AuditItem { Date = "27 Oct", Type = "Monthly – Assembly", Score = 77 },
                new AuditItem { Date = "28 Oct", Type = "Deep Dive – Packaging", Score = 82 },
                new AuditItem { Date = "29 Oct", Type = "Spot – Maintenance", Score = 69 }
            };

            CompletedRepeater.DataSource = completed;
            CompletedRepeater.DataBind();
        }

        public string GetBadgeClass(int score)
        {
            if (score >= 85) return "bg-success";
            else if (score >= 75) return "bg-warning text-dark";
            else return "bg-danger";
        }

        public class AuditItem
        {
            public string Date { get; set; }
            public string Type { get; set; }
            public int Score { get; set; }
        }
    }
}
