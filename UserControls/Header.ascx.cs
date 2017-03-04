using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;

public partial class header : System.Web.UI.UserControl
{

    protected void Page_Load(object sender, EventArgs e)
    {
        lnkHome.NavigateUrl = "~/home/" + Server.UrlEncode(SessionVar.GetString("user_name"));
    }

    protected void btnTest_Click(object sender, EventArgs e)
    {
        Debug.WriteLine("test tag" + "btn Test!");
    }
}