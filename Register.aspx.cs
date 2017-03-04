using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Security;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        panelRegStep2.Visible = false;
        panelRegStep1.Visible = true;

    }
    protected void btnReg_Click(object sender, EventArgs e)
    {
        panelRegStep2.Visible = true;
        panelRegStep1.Visible = false;
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            DataBaseManager.ConnectToSlashDatabase();
            DataBaseManager.AddNewUser(txtEmail.Text, txtPwd.Text, txtUsername.Text);
        }
        catch (Exception err)
        {
            //TODO redirect to 404 and log error
            //Response.redirect(~/404);
            
        }
        finally {
            DataBaseManager.CloseConnection();
        }
        /*
         int add = 
         DataBaseManager.closeConnection();

         lblError.Text = add + " rows affected";
         Response.Write(add + " rows affected");

       // Response.Redirect("~/login");
        */
    }
}