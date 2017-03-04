using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_DashBoard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (grvUsers.SelectedRow != null)
        {
            dtvUser.Visible = true;
        }
        else 
        {
            dtvUser.Visible=true;

        }
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (grvUsers.SelectedRow != null)
        {
            dtvUser.Visible = true;
        }
        else
        {
            dtvUser.Visible = true;

        }
    }
    protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
}