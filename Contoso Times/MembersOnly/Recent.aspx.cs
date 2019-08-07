using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Contoso_Times.MembersOnly
{
    public partial class Recent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //
            // Retrieve the user's recently-viewed-items list and bind it to the Repeater control.
            //
            RecentlyViewedItems items = (RecentlyViewedItems)Session["RecentlyViewedItems"]; 

            if (items != null)
            {
                Repeater1.DataSource = items.GetRecentlyViewedItems();
                Repeater1.DataBind();
            }
        }
    }
}