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
    public partial class mycontact : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        void resetcontact()
        {
            NameTextbox.Text = "";
            EmailTextBox.Text = "";
            SubDropDown.ClearSelection();
            MessTextbox.Text = "";
        }
        protected void BtnSubmit_Click(object sender, EventArgs e)
        {

            

            SqlConnection con = new SqlConnection(cs);
            string sp = "spcontact_Insert";

            SqlCommand cmd = new SqlCommand(sp, con);
            cmd.CommandType = CommandType.StoredProcedure;

            // Parameters must match your stored procedure definition
            cmd.Parameters.AddWithValue("@name", NameTextbox.Text);
            cmd.Parameters.AddWithValue("@email", EmailTextBox.Text);
            cmd.Parameters.AddWithValue("@subject", SubDropDown.SelectedItem.Text); // ✅ Correct way
            cmd.Parameters.AddWithValue("@message", MessTextbox.Text);

            con.Open();
            
             
            int a = cmd.ExecuteNonQuery();

            if (a > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "successcontact();", true);

                resetcontact();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "errorcontact();", true);
            }

            con.Close();

        }
    }
}