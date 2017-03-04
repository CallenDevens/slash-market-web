using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_TagControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public string TagContent
    {
        get 
        {
            return lblTag.Text;
        }
        set 
        {
            lblTag.Text = value;
        }
    }
}