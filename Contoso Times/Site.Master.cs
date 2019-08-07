using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Contoso_Times
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //
            // Write today's date to the upper left corner of the page.
            //
            Label1.Text = DateTime.Now.ToLongDateString().ToUpper();
        }

        protected void TreeView1_TreeNodeDataBound(object sender, TreeNodeEventArgs e)
        {
            //
            // Make top-level TreeView nodes nonselectable.
            //
            if (e.Node.Depth == 0)
                e.Node.SelectAction = TreeNodeSelectAction.None;
        }
    }
}