using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Diagnostics;

public partial class SignIn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        try
        {
            DataBaseManager.ConnectToSlashDatabase();
            int count = DataBaseManager.SelectUserCount(txtEmail.Text, txtPwd.Text);
            if (count != 1)
            {
                //TODO redirect to problem submit webpage
                //Response.Redirect()
            }
            else
            {
                SqlDataReader reader = DataBaseManager.SelectUser(txtEmail.Text, txtPwd.Text);
                reader.Read();
                string name = (string)reader["username"];
                SessionVar.Set<string>("user_name", name);

                string key = TextUtils.GetRandomLoginKey();
                Debug.WriteLine("test tag generated key " + key);
                Response.Cookies["login_key"].Value = key;
                Response.Cookies["login_key"].Expires = DateTime.Now.AddDays(10);
                SessionVar.SetString("login_key", key);
                Debug.WriteLine("cookie key " + Response.Cookies["login_key"].Value);
                Response.Redirect("home/" + Server.UrlEncode(name));
            }
        }
        catch (Exception err)
        {
            lblError.Text = err.Message.ToString();
        }
        finally 
        {
            DataBaseManager.CloseConnection();
        }
    }
    protected void btnReg_Click(object sender, EventArgs e)
    {
        Response.Redirect("register");
    }
}