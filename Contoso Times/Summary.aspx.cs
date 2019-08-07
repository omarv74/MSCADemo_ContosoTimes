using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Contoso_Times
{
    public partial class Summary : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //
            // If an unauthenticated user is attempting to view a category of news items
            // that is available only to authenticated users, redirect to the login page.
            //
            if (!String.IsNullOrEmpty(Request["CategoryID"]))
            {
                if (Convert.ToInt32(Request["CategoryID"]) >= 6 && !User.Identity.IsAuthenticated)
                    FormsAuthentication.RedirectToLoginPage();
            }

            //
            // Show the category name at the top of the page.
            //
            if (!String.IsNullOrEmpty(Request["CategoryID"]))
                Label1.Text = News.GetCategoryName(Convert.ToInt32(Request["CategoryID"]));
        }
    }
}