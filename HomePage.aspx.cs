using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;
using System.Configuration;

public partial class HomePage : System.Web.UI.Page
{
    string userName;
    protected void Page_Load(object sender, EventArgs e)
    {
        userName = SessionVar.GetString("user_name");
        DataBaseManager.ConnectToSlashDatabase();
       LoadDeals();

        if (!Page.IsPostBack)
        {   
            LoadTagsList();
            LoadUserInfo();

        }
        DataBaseManager.CloseConnection();

        lblUserName.Text = userName;
    }

    private void LoadUserInfo()
    {
        try
        {
            SqlDataReader reader = DataBaseManager.SelectUserInfoByName(userName);
            reader.Read();
            string filename = (string)reader["icon_pic_url"];
            string iconUrl = ConfigurationManager.AppSettings["WebHost"] + "UserData/"
                    + Server.UrlPathEncode(userName) + "/" + filename;
            imgIcon.ImageUrl = iconUrl;
            reader.Close();

        }
        catch (Exception ex)
        {
            Debug.WriteLine("load icon fail." + ex.Message);
        }
    }
    
    private void LoadDeals()
    {
        try
        {
            

            SqlDataReader reader = DataBaseManager.SelectTransactionsByName(userName);

            string id = "";
            reader.Read();
            UserControls_DealListItem item = null;
            do
            {
                string idealID = (string)reader["id"];
                if (!idealID.Equals(id))
                {
                    id = idealID;
                    item = LoadControl("~/UserControls/DealListItem.ascx") as UserControls_DealListItem;
                    if (item == null)
                    { 
                        //TODO write debug log
                        Debug.WriteLine("test tag item null");
                    }
                    
                    string dealerName = (string)reader["u_name"];
                    SqlDataReader userReader = DataBaseManager.SelectUserInfoByName(dealerName);
                    userReader.Read();
                    item.SetIconUrl(
                        ConfigurationManager.AppSettings["WebHost"] 
                        +"UserData/"
                        + Server.UrlPathEncode(dealerName) +"/"+ (string)userReader["icon_pic_url"]);
                    userReader.Close();
                    
                    item.SetUserName((string)reader["u_name"]);
                    item.SetTitle((string)reader["title"]);
                    item.SetContent((string)reader["description"]);
                    lstDeals.Controls.Add(item);

                    Debug.WriteLine("added");
                }

                item.AddTag((string)reader["tag"]);
            } while (reader.Read());
            /*
            while (reader.Read())
            {
              
                UserControls_DealListItem item = LoadControl("~/UserControls/DealListItem.ascx") as UserControls_DealListItem;
                if (item == null)
                {  Debug.WriteLine("test tag item null");}

  
                item.SetUserName(userName);
                item.SetTitle((string)reader["title"]);
                item.SetContent((string)reader["description"]);
                lstDeals.Controls.Add(item);

                Debug.WriteLine("added");
               
            }*/
            reader.Close();
             
        }
        catch (Exception err)
        {
            Debug.WriteLine("test tag:"+ err.Message);
        }
    }

    private void LoadTagsList() 
    {
        try
        {
            string userName = SessionVar.GetString("user_name");
            SqlDataReader reader = DataBaseManager.SelectUserTagsByName(userName);
            while (reader.Read())
            {
                HyperLink link = new HyperLink();
                link.ID = (string)reader["tag"];
                link.Text = (string)reader["tag"];
                link.CssClass = "list-group-item";
                tagList.Controls.Add(link);
            }
            reader.Close();

        }
        catch (Exception err)
        {
            Debug.WriteLine(err.Message);
        }
    }

    [System.Web.Services.WebMethod]
    [System.Web.Script.Services.ScriptMethod]
    public static List<String> GetKeyWords(string prefixText, int count)
    {
        Debug.WriteLine("couple service!");
        List<string> names = null;
        names = new List<string>();
        names.Add("superbat");
        names.Add("brujay");
        names.Add("damidick");
        names.Add("damijay");
        return names;
    }
}