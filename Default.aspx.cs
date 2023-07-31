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


namespace GeMProjectDetails
{
    public partial class _Default : Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["GeMInternal_DBConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                DepartmentList();
            }
            
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                string query = "INSERT INTO dbo.GeMProjDetails (ProjectNo,GeMOrderNO,date,Amount,ProjectManager,ManagerID) VALUES(@ProjectNumber,@GemOrderNo,@DateOfOrder,@Amount,@ProjectManagerName,@ProjectManagerId)";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@ProjectNumber", txtProjectNumber.Text);
                    cmd.Parameters.AddWithValue("@GemOrderNo", txtGemOrderNo.Text);
                    cmd.Parameters.AddWithValue("@DateOfOrder", txtDateOfOrder.Text);
                    cmd.Parameters.AddWithValue("@Amount", txtAmount.Text);
                    cmd.Parameters.AddWithValue("@ProjectManagerName", ddlProjectMan.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@ProjectManagerId", ddlProjectMan.SelectedValue);

                    cmd.ExecuteNonQuery();
                }
                con.Close();
                ClientScript.RegisterStartupScript(GetType(), "InsertConfirmation", "ShowConfirmation()", true);
            }
            catch(Exception ex)
            {
                Response.Write(ex);
            }
            finally
            {
                txtProjectNumber.Text = "";
                txtGemOrderNo.Text = "";
                txtDateOfOrder.Text = "";
                txtAmount.Text = "";
                ddlProjectMan.ClearSelection();
            }
        }

        private void DepartmentList()
        {
            string query = "select Man_ID, Full_Name from dbo.Master_Managers";

            SqlDataAdapter da = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            ddlProjectMan.DataSource = dt;
            ddlProjectMan.DataTextField = "Full_Name";
            ddlProjectMan.DataValueField = "Man_ID";
            ddlProjectMan.DataBind();
            ddlProjectMan.Items.Insert(0, new ListItem("--Select Manager", "0"));

        }

        protected void ddlProjectMan_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}