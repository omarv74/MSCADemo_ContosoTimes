using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Contoso_Times
{
    public partial class ShowItem : System.Web.UI.Page
    {
        void Page_Load(Object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Request["ItemID"]))
            {
                int id = Convert.ToInt32(Request["ItemID"]);
                int category = News.GetNewsItemCategory(id);

                //
                // If an unauthenticated user is attempting to view a news item that is
                // available only to authenticated users, redirect to the login page.
                //
                if (category >= 6 && !User.Identity.IsAuthenticated)
                    FormsAuthentication.RedirectToLoginPage();

                //
                // Show the category name at the top of the page.
                //
                Label1.Text =  News.GetCategoryName(category);

                //
                // If the user is authenticated, add this page to his or her recently-viewed-items list.
                //
                if (User.Identity.IsAuthenticated)
                {
                    RecentlyViewedItems items = (RecentlyViewedItems)Session["RecentlyViewedItems"];

                    if (items == null)
                        items = new RecentlyViewedItems();

                    items.AddItem(id, DateTime.Now);
                    Session["RecentlyViewedItems"] = items;
                }
            }
        }
    }
}