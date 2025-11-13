using System;
using System.Web.UI;

namespace FiveS.Pages
{
    public partial class login : Page
    {
        // store redirect page across postbacks
        private string RedirectPage
        {
            get { return ViewState["RedirectPage"] as string; }
            set { ViewState["RedirectPage"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Get the redirect page from query string on first load
                string redirect = Request.QueryString["redirect"];
                if (!string.IsNullOrEmpty(redirect))
                {
                    RedirectPage = redirect;
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = "admin";
            string password = "12345";

            if (txtUsername.Text.Trim() == username && txtPassword.Text.Trim() == password)
            {
                if (!string.IsNullOrEmpty(RedirectPage))
                {
                    Response.Redirect(RedirectPage); // go to original page
                }
                else
                {
                    Response.Redirect("Dashboard1.aspx"); // default page
                }
            }
            else
            {
                lblMessage.Text = "Invalid username or password!";
                txtUsername.Text = "";
                txtPassword.Text = "";
            }
        }
    }
}
