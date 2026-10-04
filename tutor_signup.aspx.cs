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
    public partial class tutor_signup : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindcountry();

            }
        }
        void resetsignup()
        {
            nametxt.Text = "";
            surenametxt.Text = "";
            genderdropdown.ClearSelection();
            agetxt.Text = "";
            emailtxt.Text = "";
            Martialdrop.ClearSelection();
            Countrydrop.ClearSelection();
            citydrop.ClearSelection();
            adresstxt.Text = "";
            Qualificationdrop.ClearSelection();
            Degreetxt.Text = "";
            contacttxt.Text = "";
            usernametxt.Text = "";
            Passwordtxt.Text = "";
            Cpassword.Text = "";
            Experiencedrop.ClearSelection();
           
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

    
        protected void Tutorsignup_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            try
            {
                string query = @"INSERT INTO tutor_signup
           (name, surname, gender, age, email,marital_status,country, city, address, qualification , degree, contact, username, password,Experience)
        VALUES (@name,@surname,@gender,@age,@email,@marital_status,@country,@city,@address,@qualification,@degree,@contact,@username,@password,@Experience)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@name", nametxt.Text);
                cmd.Parameters.AddWithValue("@surname", surenametxt.Text);
                cmd.Parameters.AddWithValue("@gender", genderdropdown.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@age", Convert.ToInt32(agetxt.Text));
                cmd.Parameters.AddWithValue("@email", emailtxt.Text);
                cmd.Parameters.AddWithValue("@marital_status", Martialdrop.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@country", Countrydrop.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@city", citydrop.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@address", adresstxt.Text);
                cmd.Parameters.AddWithValue("@qualification", Qualificationdrop.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@degree", Degreetxt.Text);
                cmd.Parameters.AddWithValue("@contact", contacttxt.Text);
                cmd.Parameters.AddWithValue("@username", usernametxt.Text);
                cmd.Parameters.AddWithValue("@password", Passwordtxt.Text);
                cmd.Parameters.AddWithValue("@Experience", Experiencedrop.SelectedItem.ToString());

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