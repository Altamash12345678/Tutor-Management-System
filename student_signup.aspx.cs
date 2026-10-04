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
    public partial class student_signup : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
             if(!IsPostBack){
                 bindcountry();
                
             }

        }


        void resetsignup()
        {
           nametxt.Text = "";
           fathernametxt.Text="";
           surenametxt.Text="";
           genderdropdown.ClearSelection();
           agetxt.Text = "";
           Countrydrop.ClearSelection ();
           citydrop.ClearSelection();
           adresstxt.Text = "";
           standardtxt.Text = "";
           Goingdrop.ClearSelection();
           subjecttxt.Text = "";
           contacttxt.Text = "";
           tuitiontypes.ClearSelection();
           Tutorprefer.ClearSelection();
           usernametxt.Text = "";
           Passwordtxt.Text = "";
        }


        void bindcountry()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "SELECT * FROM country";
            SqlDataAdapter sda = new SqlDataAdapter(query, con);
            DataTable data = new DataTable();
            sda.Fill(data);

            Countrydrop.DataSource = data;
            Countrydrop.DataTextField = "country_name";
            Countrydrop.DataValueField = "country_id";
            Countrydrop.DataBind();

            Countrydrop.Items.Insert(0, new ListItem("Select Country", "0"));
            Countrydrop.AutoPostBack = true;

        }
        void bindcity(int country_id)
        {

                SqlConnection con = new SqlConnection(cs);
         
                string query = "SELECT * FROM city WHERE c_id = @country_id";
                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                sda.SelectCommand.Parameters.AddWithValue("@country_id", country_id);
                DataTable data = new DataTable();
                sda.Fill(data);

                citydrop.DataSource = data;
                citydrop.DataTextField = "city_name";
                citydrop.DataValueField = "city_id";
                citydrop.DataBind();

                citydrop.Items.Insert(0, new ListItem("Select City", "0"));
            }

    




        protected void btnsignup_Click(object sender, EventArgs e)
        {
           
                SqlConnection con = new SqlConnection(cs);
                try
                {
                    string query = @"INSERT INTO Student_Signup
        (name, fname, surname, gender, age, country, city, address, standard, goingto, subject, contactno, tuitiontype, tutorprefer, username, password)
        VALUES (@name,@fname,@surname,@gender,@age,@country,@city,@address,@standard,@goingto,@subject,@contactno,@tuitiontype,@tutorprefer,@username,@password)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@name", nametxt.Text);
                cmd.Parameters.AddWithValue("@fname", fathernametxt.Text);
                cmd.Parameters.AddWithValue("@surname", surenametxt.Text);
                cmd.Parameters.AddWithValue("@gender", genderdropdown.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@age", Convert.ToInt32(agetxt.Text));
                cmd.Parameters.AddWithValue("@country", Countrydrop.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@city", citydrop.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@address", adresstxt.Text);
                cmd.Parameters.AddWithValue("@standard", standardtxt.Text);
                cmd.Parameters.AddWithValue("@goingto", Goingdrop.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@subject", subjecttxt.Text);
                cmd.Parameters.AddWithValue("@contactno", contacttxt.Text);
                cmd.Parameters.AddWithValue("@tuitiontype", tuitiontypes.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@tutorprefer", Tutorprefer.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@username", usernametxt.Text);
                cmd.Parameters.AddWithValue("@password", Passwordtxt.Text);

                con.Open();
                int a = cmd.ExecuteNonQuery();
                if (a > 0)
                {
                    ScriptManager.RegisterStartupScript(
              this,
              this.GetType(),
              "popup",
              "Swal.fire({ title: 'Success', text: 'you have Register Sucessfully!', icon: 'success' });",
              true
          );

                    resetsignup();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(
              this,
              this.GetType(),
              "popup",
              "Swal.fire({ title: 'failure', text: 'Registration failed try another username!', icon: 'error' });",
              true
          );

                }
            }
            catch (SqlException ex)
            {
                if (ex.Message.Contains("UNIQUE KEY constraints"))
                {

                    ScriptManager.RegisterStartupScript(
             this,
             this.GetType(),
             "popup",
             "Swal.fire({ title: 'Failure', text: 'Registration Failed! " + usernametxt.Text + " already Exist.', icon: 'error' });",
             true
         );

                }
                else
                {
                    ScriptManager.RegisterStartupScript(
          this,
          this.GetType(),
          "popup",
          "Swal.fire({ title: 'failure', text: 'Registration failed !', icon: 'error' });",
          true);
                }
            }

            finally
            {
                con.Close();
            }
           
        }

        protected void Countrydrop_SelectedIndexChanged(object sender, EventArgs e)
        {
            int country_id = Convert.ToInt32(Countrydrop.SelectedValue);
            bindcity(country_id);
        }
       
    }
}