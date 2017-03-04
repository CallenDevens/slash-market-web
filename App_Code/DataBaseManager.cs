using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.Security;
using System.Data;
using System.Diagnostics;

/// <summary>
///DataBaseManager 的摘要说明
/// </summary>
public class DataBaseManager
{
    private static SqlConnection conn;

	public DataBaseManager()
	{

	}

    
    public static void ConnectToSlashDatabase() 
    {
        string connstring = WebConfigurationManager.ConnectionStrings["slashmarket"].ConnectionString;
        conn = new SqlConnection(connstring);
        conn.Open();;
    }

    public static void CloseConnection()
    {
        conn.Close();
    }
    public static SqlDataReader SelectUsers() 
    {
        SqlCommand myCommand = new SqlCommand();
        myCommand.Connection = conn;
        myCommand.CommandText = "SELECT * FROM slash_users ";
        return myCommand.ExecuteReader();
    }

    public static SqlDataReader SelectUser(string email, string pwd)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;
        cmd.CommandText = "SELECT * FROM slash_users where user_email=@email and user_password=@pwd";
        cmd.Parameters.AddWithValue("@email", email);
        cmd.Parameters.AddWithValue("@pwd", FormsAuthentication.HashPasswordForStoringInConfigFile(pwd,"MD5"));
        return cmd.ExecuteReader();
    }

    public static SqlDataReader SelectForumThreads()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;
        cmd.CommandText = "SELECT thread_id, thread_type,thread_title,thread_author,thread_last_post,is_anonymous FROM forum_thread;";
        return cmd.ExecuteReader();
    }


    public static int SelectUserCount(string email, string pwd)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;
        cmd.CommandText = "SELECT count(*) FROM slash_users where user_email=@email and user_password=@pwd";
        cmd.Parameters.AddWithValue("@email", email);
        cmd.Parameters.AddWithValue("@pwd", FormsAuthentication.HashPasswordForStoringInConfigFile(pwd, "MD5"));
        return (int)cmd.ExecuteScalar();
    }

    public static int SelectUserCountByName(string name)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;
        cmd.CommandText = "SELECT count(*) FROM slash_users where username=@name";
        cmd.Parameters.AddWithValue("@name", name);
        return (int)cmd.ExecuteScalar();
    }


    public static int AddNewUser(string email, string pwd, string name)
    { 
        string insertSQL="insert into slash_users (";
        insertSQL += "user_email, user_password, username, user_register_dt) ";
        insertSQL += " values(@email, @password, @username, GETDATE())";

        SqlCommand cmd = new SqlCommand(insertSQL, conn);
        cmd.Parameters.AddWithValue("@email", email);
        cmd.Parameters.AddWithValue("@password", FormsAuthentication.HashPasswordForStoringInConfigFile( pwd, "MD5"));
        cmd.Parameters.AddWithValue("@username", name);

        int added = 0;
        added = cmd.ExecuteNonQuery();

        return added;
    }

    public static void InsertDealTransaction(string username, string title, string desc, List<string> tagList)
    {
        SqlTransaction trans = conn.BeginTransaction();

        SqlCommand cmdCount = new SqlCommand();
        cmdCount.Connection = conn;
        cmdCount.CommandText = "SELECT count(*) FROM user_transaction where u_name=@name";
        cmdCount.Transaction = trans;
        cmdCount.Parameters.AddWithValue("@name", username);
        int count = (int)cmdCount.ExecuteScalar();

        string DealID = username+ "_" + (count+1);

        try
        {
            string insertDealSQL = "insert into slash_transactions (";
            insertDealSQL += "id, transaction_title, transaction_description ) values(";
            insertDealSQL += "@id, @title, @desc);";

            SqlCommand cmdDeal = new SqlCommand(insertDealSQL, conn, trans);
            cmdDeal.Parameters.AddWithValue("@id", DealID);
            cmdDeal.Parameters.AddWithValue("@title", title);
            cmdDeal.Parameters.AddWithValue("@desc", desc);
            cmdDeal.ExecuteNonQuery();

            string insertRelationSQL = "insert into user_transaction (u_name,trans_id, trans_datetime) values(";
            insertRelationSQL += "@name, @d_id, GETDATE());";
            SqlCommand cmdUrRelation = new SqlCommand(insertRelationSQL, conn, trans);
            cmdUrRelation.Parameters.AddWithValue("@name", username);
            cmdUrRelation.Parameters.AddWithValue("@d_id", DealID);
            cmdUrRelation.ExecuteNonQuery();

            string insertTagSQL = "insert into trans_tags(";
            insertTagSQL += "id,tag) values(@id, @tag);";
            foreach (string tag in tagList)
            {
                SqlCommand cmd = new SqlCommand(insertTagSQL, conn, trans);
                cmd.Parameters.AddWithValue("@id", DealID);
                cmd.Parameters.AddWithValue("@tag", tag);
                int affected =  cmd.ExecuteNonQuery();
            }
            trans.Commit();
        }
        catch (Exception err) 
        {
            trans.Rollback();
            throw err;
        }
    }
    public static void insertThread(string userName, string title, string content, string type, int isAno)
    {
        string insertSQL = "insert into forum_thread (thread_author,thread_type, thread_title,thread_content, ";
        insertSQL += "thread_post_date, thread_last_post,is_anonymous) values";
        insertSQL += "(@author, @type, @title, @content, GETDATE(), GETDATE(),@isa )";

        SqlCommand cmd = new SqlCommand(insertSQL, conn);
        cmd.Parameters.AddWithValue("@author", userName);
        cmd.Parameters.AddWithValue("@type", type);
        cmd.Parameters.AddWithValue("@title", title);
        cmd.Parameters.AddWithValue("@content", content);
        cmd.Parameters.AddWithValue("@isa", isAno);
        cmd.ExecuteNonQuery();
    }

    /*move to admin management*/
    public static SqlDataAdapter SelectTransactions(string name)
    {

        string selectSQL = "select st.transaction_title , st.transaction_description, ut.trans_datetime ";
        selectSQL += " from slash_transactions as st inner join user_transaction as ut ON st.id = ut.trans_id ";
        selectSQL += "where ut.u_name = @name";

        SqlCommand cmd = new SqlCommand(selectSQL, conn);
        cmd.Parameters.AddWithValue("@name", name);
        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        return adapter;
    }

    public static SqlDataReader SelectTransactionsByName(string name)
    {

        string selectSQL ="select st.id, st.transaction_title as title ,";
        selectSQL += "st.transaction_description as description,st.transaction_datetime as dt,";
        selectSQL +="ut.u_name , tt.tag ";
        selectSQL += "from slash_transactions as st,user_transaction as ut,trans_tags as tt ";
        selectSQL += " where st.id = ut.trans_id and tt.id= st.id and ";
        selectSQL += "(ut.u_name=@name or tt.tag in (select tag from user_tags where user_tags.username=@uname));";

        SqlCommand cmd = new SqlCommand(selectSQL, conn);
        cmd.Parameters.AddWithValue("@name", name);
        cmd.Parameters.AddWithValue("@uname", name);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader == null)
        {
            System.Diagnostics.Debug.WriteLine("test tag" + "read si null");
        }
        return reader;
    }

    public static SqlDataReader SelectUserTagsByName(string name)
    {
        string selectSQL = "select tag from user_tags where username=@name; ";
        SqlCommand cmd = new SqlCommand(selectSQL, conn);
        cmd.Parameters.AddWithValue("@name", name);
        SqlDataReader reader = cmd.ExecuteReader();
        return reader;
    }

    public static SqlDataReader SelectUserInfoByName(string name)
    {
        string selectSQL = "select user_password ,user_birthday,user_blog,user_introduction,";
        selectSQL+="user_register_dt,icon_pic_url from slash_users where username=@name; ";

        SqlCommand cmd = new SqlCommand(selectSQL, conn);
        cmd.Parameters.AddWithValue("@name", name);
        SqlDataReader reader = cmd.ExecuteReader();
        return reader;
    }
    public static void UpdateUserProfile(string name, string gender, string intro, DateTime? birthdaydate, string blog)
    {
        string updateSQL = "update slash_users set user_gender=@gender, user_introduction=@intro,";
        updateSQL += "user_birthday = @birth , user_blog = @blog where username=@name; ";

        SqlCommand cmd = new SqlCommand(updateSQL, conn);
        if(birthdaydate == null)
        {
            Debug.WriteLine("test error birthday null");
        }
        cmd.Parameters.AddWithValue("@gender", gender);
        cmd.Parameters.AddWithValue("@intro", intro);
        cmd.Parameters.Add((new SqlParameter("@birth", birthdaydate)));
        cmd.Parameters.AddWithValue("@blog", blog);

        cmd.Parameters.AddWithValue("@name", name);
        cmd.ExecuteNonQuery();

    }

    public static void UpdateUserIcon(string userName, string filename)
    {
        string updateSQL = "update slash_users set icon_pic_url = @icon where username=@name;";
        SqlCommand cmd = new SqlCommand(updateSQL, conn);
        cmd.Parameters.AddWithValue("@icon", filename);
        cmd.Parameters.AddWithValue("@name", userName);
        cmd.ExecuteNonQuery();
    }
}