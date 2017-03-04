using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Transactions : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataBaseManager.ConnectToSlashDatabase();
        SqlDataAdapter adapter = DataBaseManager.SelectTransactions(SessionVar.GetString("user_name"));

        DataSet ds = new DataSet();
        adapter.Fill(ds, "transactions");
        grvDeals.DataSource = ds;
        grvDeals.DataBind();
        DataBaseManager.CloseConnection();


    }
}