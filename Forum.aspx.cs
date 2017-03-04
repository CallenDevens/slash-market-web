using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Forum : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadThreadTable();
    }

    private void LoadThreadTable() 
    {
        DataBaseManager.ConnectToSlashDatabase();

        SqlDataReader reader = DataBaseManager.SelectForumThreads();
        while (reader.Read())
        {
            TableRow row = new TableRow();
            row.Cells.Add(new TableCell());

            TableCell titleCell = new TableCell();
            CustomizeTableCell(titleCell,"["+ (string)reader["thread_type"] +"]" + (string)reader["thread_title"]);
            row.Cells.Add(titleCell);

            TableCell repCell = new TableCell();
            CustomizeTableCell(repCell," 0");
            row.Cells.Add(repCell);

            TableCell lastPostCell = new TableCell();
            CustomizeTableCell(lastPostCell, reader["thread_last_post"].ToString());
            row.Cells.Add(lastPostCell);

            tblList.Rows.Add(row);
        }

        DataBaseManager.CloseConnection();
    }

    private void CustomizeTableCell(TableCell cell, string text)
    {
        cell.Text = text;
        cell.Style["padding"] = "10px";
    
    }

    protected void btnNewThd_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/newThread");
    }
}