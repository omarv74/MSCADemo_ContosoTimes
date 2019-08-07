using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;


public class News
{
    public static DataTable GetNewsItem(int ItemID)
    {
        SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TimesConnectionString"].ConnectionString);

        SqlCommand command = new SqlCommand("proc_GetNewsItem", connection);
        command.CommandType = CommandType.StoredProcedure;
        command.Parameters.Add("ItemID", SqlDbType.Int).Value = ItemID;

        DataTable dt = new DataTable();
        SqlDataAdapter adapter = new SqlDataAdapter(command);
        adapter.Fill(dt);

        return dt;
    }

    public static int GetNewsItemCategory(int ItemID)
    {
        SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TimesConnectionString"].ConnectionString);

        SqlCommand command = new SqlCommand("proc_GetNewsItemCategory", connection);
        command.CommandType = CommandType.StoredProcedure;
        command.Parameters.Add("ItemID", SqlDbType.Int).Value = ItemID;


        connection.Open();
        object result = command.ExecuteScalar();
        return (result != null) ? (int)result : -1;

        connection.Close();

    }

    public static void GetNewsItemCategoryAndTitle(int ItemID, out int CategoryID, out string title)
    {
        SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TimesConnectionString"].ConnectionString);

        SqlCommand command = new SqlCommand("proc_GetNewsItemCategoryAndTitle", connection);
        command.CommandType = CommandType.StoredProcedure;
        command.Parameters.Add("ItemID", SqlDbType.Int).Value = ItemID;


        connection.Open();
        SqlDataReader reader = command.ExecuteReader();

        if (reader.HasRows)
        {
            reader.Read();
            CategoryID = (int)reader["CategoryID"];
            title = (string)reader["Title"];
        }
        else
        {
            CategoryID = -1;
            title = String.Empty;
        }

        connection.Close();

    }

    public static void GetNewsItemTitleAndBodyText(int ItemID, out string title, out string text)
    {
        SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TimesConnectionString"].ConnectionString);

        SqlCommand command = new SqlCommand("proc_GetNewsItemTitleAndBodyText", connection);
        command.CommandType = CommandType.StoredProcedure;
        command.Parameters.Add("ItemID", SqlDbType.Int).Value = ItemID;

        connection.Open();
        SqlDataReader reader = command.ExecuteReader();

        if (reader.HasRows)
        {
            reader.Read();
            title = (string)reader["Title"];
            text = (string)reader["BodyText"];
        }
        else
        {
            title = String.Empty;
            text = String.Empty;
        }

        connection.Close();

    }

    public static DataTable GetAllNewsItemsInCategory(int CategoryID)
    {
        SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TimesConnectionString"].ConnectionString);

        SqlCommand command = new SqlCommand("proc_GetAllNewsItemsInCategory", connection);
        command.CommandType = CommandType.StoredProcedure;
        command.Parameters.Add("CategoryID", SqlDbType.Int).Value = CategoryID;

        DataTable dt = new DataTable();
        SqlDataAdapter adapter = new SqlDataAdapter(command);
        adapter.Fill(dt);

        return dt;
    }

    public static DataTable GetAllNewsItems()
    {
        SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TimesConnectionString"].ConnectionString);

        SqlCommand command = new SqlCommand("proc_GetAllNewsItems", connection);
        command.CommandType = CommandType.StoredProcedure;

        DataTable dt = new DataTable();
        SqlDataAdapter adapter = new SqlDataAdapter(command);
        adapter.Fill(dt);

        return dt;
    }

    public static void DeleteNewsItem(int original_ItemID)
    {
        SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TimesConnectionString"].ConnectionString);

        SqlCommand command = new SqlCommand("proc_DeleteNewsItem", connection);
        command.CommandType = CommandType.StoredProcedure;
        command.Parameters.Add("ItemID", SqlDbType.Int).Value = original_ItemID;


        connection.Open();
        command.ExecuteNonQuery();

        connection.Close();

    }

    public static void UpdateNewsItem(int original_ItemID, int CategoryID, string Title, string Subtitle, string BodyText)
    {
        SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TimesConnectionString"].ConnectionString);

        SqlCommand command = new SqlCommand("proc_UpdateNewsItem", connection);
        command.CommandType = CommandType.StoredProcedure;
        command.Parameters.Add("ItemID", SqlDbType.Int).Value = original_ItemID;
        command.Parameters.Add("CategoryID", SqlDbType.Int).Value = CategoryID;
        command.Parameters.Add("Title", SqlDbType.VarChar, 128).Value = Title;
        command.Parameters.Add("Subtitle", SqlDbType.VarChar, 512).Value = Subtitle;
        command.Parameters.Add("BodyText", SqlDbType.Text).Value = BodyText;


        connection.Open();
        command.ExecuteNonQuery();

        connection.Close();

    }

    public static string GetCategoryName(int CategoryID)
    {
        string[] names = {
            "Local", "National", "World",
            "Baseball", "Basketball", "Football",
            "Travel", "Entertainment", "Technology"
        };

        if (CategoryID >= 0 && CategoryID < names.Length)
            return names[CategoryID];
        else
            return String.Empty;
    }
}
