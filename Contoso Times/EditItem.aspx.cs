using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Contoso_Times
{
    public partial class EditItem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.Identity.IsAuthenticated)
            {
                FormsAuthentication.RedirectToLoginPage();
            }

            if (!Page.IsPostBack)
            {
                int ItemID = -1;
                if (int.TryParse(Request.QueryString["ItemID"], out ItemID))
                {
                    DataTable dtNews = News.GetNewsItem(ItemID);
                    if (dtNews.Rows.Count > 0)
                    {
                        txtTitle.Text = dtNews.Rows[0]["Title"].ToString();
                        txtSubtitle.Text = dtNews.Rows[0]["Subtitle"].ToString();
                        txtBodyText.Text = dtNews.Rows[0]["BodyText"].ToString();
                    }
                } 
            }
        }

        protected void UpdateNews(object sender, EventArgs e)
        {
            string title = txtTitle.Text;
            string subTitle = txtSubtitle.Text;
            string bodyText = txtBodyText.Text;

            int ItemID = -1;
            if (int.TryParse(Request.QueryString["ItemID"],out ItemID))
            {
                string updateQuery = " UPDATE [News] SET [Title]='" + title + "', [Subtitle]='"+subTitle+"', [BodyText]='"+bodyText+"' WHERE [ItemID]="+ItemID;

                using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TimesConnectionString"].ConnectionString))
                {
                    SqlCommand command = new SqlCommand(updateQuery, connection);
                    command.Connection.Open();
                    command.ExecuteNonQuery();
                    Response.Redirect("~/ShowItem.aspx?ItemID=" + ItemID);
                }
            }
        }
    }
}