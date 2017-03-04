using System;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string userName =SessionVar.GetString("user_name");

        if (isLogin())
        {
            Response.Redirect("~/home/" + Server.UrlEncode(userName));
        }
        else
        {
            Response.Redirect("~/login");
        }

    }

    private  Boolean isLogin()
    {
        string key1 = SessionVar.GetString("login_key");
        string key2 = Request.Cookies["login_key"].Value;

        Debug.WriteLine("test tag: key1 " + key1);
        Debug.WriteLine("test tag: key2 " + key2);

        if (key1.Equals(key2))
        {
            return true;
        }
        else
        {
            return false;
        }
    }
}