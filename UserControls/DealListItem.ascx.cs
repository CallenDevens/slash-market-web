using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_DealListItem : System.Web.UI.UserControl
{
    public UserControls_DealListItem() { }
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void SetUserName(string name) 
    {
        lblUsername.Text = name;
    }

    public void SetTitle(string title)
    {
        lblTitle.Text = title;
    }

    public void SetContent(string content)
    {
        pDesc.Text = content;
    }
    public void AddTag(string tag) {
        deal_tags.InnerHtml += "<span>"+tag+"</span>&nbsp;&nbsp;&nbsp";
    }

    public void SetIconUrl(string url) 
    {
        imgDesc.ImageUrl = url;
    }
}