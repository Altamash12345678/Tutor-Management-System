using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace TMS_Project
{
    public class variables
    {

        public static string connectiondb()
        {
            return ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        }
    }
}