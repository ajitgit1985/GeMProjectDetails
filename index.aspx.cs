using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Net.Mail;

namespace GeMProjectDetails
{
    public partial class index : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["GeMInternal_DBConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                txtUserName.Focus();
                lblMsg.Visible = false;
            }
        }

        protected void btnLogin_ServerClick(object sender, EventArgs e)
        {
            try
            {
                string UserRole;
                string query = "select *from dbo.UserLogin where UserName = @UserName  and password = @Password and isActive = 1";
                DataTable dt = new DataTable();
                
                    con.Open();
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@UserName", txtUserName.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    sda.Fill(dt);
                    con.Close();
                

                if (dt.Rows.Count > 0)
                {
                    Session["Full_Name"] = Convert.ToString(dt.Rows[0]["Full_Name"].ToString());
                    UserRole = Convert.ToString(dt.Rows[0]["roleId"].ToString());

                    if (UserRole.Equals("3"))
                    {
                        Response.Redirect("Default.aspx");
                    }
                    else if(UserRole.Equals("2")){
                        Response.Redirect("");
                    }
                    else
                    {
                        Response.Redirect("");
                    }
                }
                else
                {
                    lblMsg.Text = "Invalid User no Role assigned";
                    lblMsg.Visible = true;
                    return;
                }
            }
            catch
            {

            }
        }

    }
}