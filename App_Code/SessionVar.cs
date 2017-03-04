using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

/// <summary>
///SessionVar 的摘要说明
/// </summary>
public class SessionVar
{
	public SessionVar()
	{
	}

    static HttpSessionState Session 
    {
        get 
        {
            if (HttpContext.Current == null) 
            {
                throw new ApplicationException("No http Context");
            }
            return HttpContext.Current.Session;
        }
    }

    public static T Get<T>(string key)
    {
        if (Session[key] == null)
        {
            return default(T);
        }
        else
        {
            return (T)Session[key];
        }
    }

    public static void Set<T>(string key, T value) 
    {
        Session[key] = value;
    }

    public static string GetString(string key)
    {
        string s = Get<string>(key);
        return s == null ? string.Empty : s;
    }

    public static void SetString(string key, string value)
    {
        Set<string>(key, value);
    }
}