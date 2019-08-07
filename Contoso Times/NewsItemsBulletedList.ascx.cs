using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Contoso_Times
{
    public partial class NewsItemsBulletedList : System.Web.UI.UserControl
    {

        private int _id = 0;
        public int CategoryID
        {
            get { return _id; }
            set { _id = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //
            // Assign a value (the category ID assigned to this control) to the
            // ObjectDataSource's SelectParameter so this control will display
            // only the headlines assigned to it.
            //
            ObjectDataSource ods = (ObjectDataSource)FindControl("ObjectDataSource1");
            ods.SelectParameters["CategoryID"].DefaultValue = CategoryID.ToString();
        }
    }
}