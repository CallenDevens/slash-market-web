using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
///TextUtils 的摘要说明
/// </summary>
public class TextUtils
{
    private static Random m_rnd = new Random();
    private static char getRandomChar()
    {
        int ret = m_rnd.Next(122);
        while (ret < 48 || (ret > 57 && ret < 65) || (ret > 90 && ret < 97))
        {
            ret = m_rnd.Next(122);
        }
        return (char)ret;
    }
    private static string getRandomString(int length)
    {
        StringBuilder sb = new StringBuilder(length);
        for (int i = 0; i < length; i++)
        {
            sb.Append(getRandomChar());
        }
        return sb.ToString();
    }
    public static string GetRandomLoginKey()
    {
        return getRandomString(80);
    }
	public TextUtils()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}
}