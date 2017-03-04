using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Transaction : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnAddTag_Click(object sender, EventArgs e)
    {
        ListItem item = new ListItem(txtTag.Text);
        lstTags.Items.Add(item);
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string username = SessionVar.GetString("user_name");
        lblError.Text = username;

        DataBaseManager.ConnectToSlashDatabase();

        List<string> tagList = new List<string>();
        foreach (ListItem item in lstTags.Items)
        {
            tagList.Add(item.Text);
        }
        try
        {
            DataBaseManager.InsertDealTransaction(username, txtTitle.Text,
    txtDescription.Text , tagList);
            DataBaseManager.CloseConnection();
        }
        catch (Exception err) 
        {
            lblError.Text = err.Message;
        }

        

    }
}