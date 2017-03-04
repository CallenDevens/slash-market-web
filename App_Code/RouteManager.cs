using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;

/// <summary>
///RouteManager 的摘要说明
/// </summary>
public class RouteManager
{
	public RouteManager()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}
    public static  void MapWbisiteRoute()
    {
        RouteTable.Routes.MapPageRoute("login",       "login",           "~/SignIn.aspx");
        RouteTable.Routes.MapPageRoute("register",    "register",        "~/Register.aspx");
        RouteTable.Routes.MapPageRoute("home",        "home/{username}", "~/HomePage.aspx");
        RouteTable.Routes.MapPageRoute("transaction", "transaction",     "~/Transaction.aspx");
        RouteTable.Routes.MapPageRoute("transactions", "transactions", "~/Transactions.aspx");
        RouteTable.Routes.MapPageRoute("newThread", "newThread", "~/NewThread.aspx");
        RouteTable.Routes.MapPageRoute("forum", "forum", "~/Forum.aspx");
        RouteTable.Routes.MapPageRoute("settings", "settings", "~/Settings.aspx");
    }
}