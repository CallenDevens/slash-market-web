using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;

public partial class UserSetting : System.Web.UI.Page
{
    string userName;
    protected void Page_Load(object sender, EventArgs e)
    {
        /* to fetch date from textbox */
        txtDate.Attributes.Add("readonly", "readonly");
        
        userName = SessionVar.GetString("user_name");
        if (userName.Equals(""))
        {
            Response.Redirect("login");
        }
        DataBaseManager.ConnectToSlashDatabase();
        LoadTags();
        if (!Page.IsPostBack) 
        {
            LoadUserInfo();
        }
        
        DataBaseManager.CloseConnection();
    }

    private void LoadUserInfo()
    {
        try
        {
            SqlDataReader reader = DataBaseManager.SelectUserInfoByName(userName);
            reader.Read();
            txtIntroduction.Text = (string)reader["user_introduction"];
            txtBlog.Text = (string)reader["user_blog"];
            reader.Close();
        }
        catch (Exception ex)
        {
            Debug.WriteLine("load user fail:" + ex.Message);
        }

    }
    protected void btnTags_Click(object sender, EventArgs e)
    {
    }

    private void LoadTags() 
    {
        
        SqlDataReader reader = DataBaseManager.SelectUserTagsByName(userName);

        pnlTags.Controls.Clear();
       /*;
        udpTags.ContentTemplateContainer.Controls.Clear();
        
        */
        while (reader.Read())
        {
            UserControls_TagControl tag = LoadControl("~/UserControls/TagControl.ascx") as UserControls_TagControl;
            tag.TagContent = (string)reader["tag"];
            if (tag != null)
            {
                pnlTags.Controls.Add(tag);
 
            }
        }
        reader.Close();
        
        divAddTags.Visible = true;
    }
    
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        Debug.WriteLine("upload start!" );

        if (uploadImg.HasFile)
        {
            Debug.WriteLine("upload file!");
            try
            {
                string filename = Path.GetFileName(uploadImg.FileName);
                Debug.WriteLine("upload file:" + filename);
                string path = Server.MapPath("~/UserData/" + Server.UrlPathEncode(userName));
                
                if (!Directory.Exists(path))
                {
                    Debug.WriteLine("create location");
                    Directory.CreateDirectory(path);
                }
                Debug.WriteLine(path);
                uploadImg.SaveAs(path+"/"+filename);

                DataBaseManager.ConnectToSlashDatabase();
                DataBaseManager.UpdateUserIcon(userName, filename);
                DataBaseManager.CloseConnection();

                imgIcon.ImageUrl = ConfigurationManager.AppSettings["WebHost"] +"UserData/"
                    + Server.UrlPathEncode(userName) +"/"+ filename;
                ActiveTab.Text = "avatar";

                pnlFileInfo.CssClass = "alert alert-success fade in";
                pnlContent.InnerHtml = "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>Image Upload Successfully.";
                pnlFileInfo.Visible = true;
            }
            catch (Exception ex)
            {
                Debug.WriteLine("upload Exception:" + ex.Message);
            }
            
            
        }
        else
        {
            pnlFileInfo.CssClass = "alert alert-danger fade in";
            pnlContent.InnerHtml = "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a> Please Select an Image.";
            pnlFileInfo.Visible = true;
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string gender ="";
        if (rbFemale.Checked)
        {
            gender = "F";
        }
        else if(rbMale.Checked)
        {
            gender = "M";
        }

        
        try
        {
            DateTime dt;
            if (!txtDate.Text.Equals(""))
            {
                dt = Convert.ToDateTime(txtDate.Text);
            }
            else
            {
                dt = Convert.ToDateTime("01/01/1980");         
            }
            DataBaseManager.ConnectToSlashDatabase();
            DataBaseManager.UpdateUserProfile(userName, gender, txtIntroduction.Text, dt, txtBlog.Text);
            Debug.WriteLine("update user peofile1");
            DataBaseManager.CloseConnection();
        }
        catch (Exception err)
        {
            Debug.WriteLine("test error:" + err.Message +
                " " + txtDate.Text);
        }

        udpProfile.Update();
    }

}