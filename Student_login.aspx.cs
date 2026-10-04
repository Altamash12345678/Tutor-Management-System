using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace TMS_Project
{
    public partial class Student_login : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void studlogin_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select * from Student_Signup where username = @username and password = @password";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@username", username.Text);
            cmd.Parameters.AddWithValue("@password", Password.Text);

            con.Open();

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows == true)
            {
                //Response.Write("<script>alert('Login successful')</script>");
                Session["student_username"] = username.Text;
                Response.Redirect("student/student_index.aspx");
            }
            else
            {
                ScriptManager.RegisterStartupScript(
        this,
        this.GetType(),
        "popup",
        "Swal.fire({ title: 'Failure', text: 'Username & Password incorrect', icon: 'error' });",
        true
    );

            }

            con.Close();
        }
    }
}