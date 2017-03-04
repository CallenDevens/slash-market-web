using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NewThread : System.Web.UI.Page
{
    public string userName;
    protected void Page_Load(object sender, EventArgs e)
    {
        userName = SessionVar.GetString("user_name");
    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        DataBaseManager.ConnectToSlashDatabase();
        DataBaseManager.insertThread(userName, txtTitle.Text, txtContent.Text, "Free", 0);
        DataBaseManager.CloseConnection();
    }
}