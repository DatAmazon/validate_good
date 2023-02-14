using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ThucHanhWeb
{
    public partial class Infor : System.Web.UI.Page
    {
        //pro vào đọc tin nhắn giúp t vs
        protected void Page_Load(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["connectToDB"].ConnectionString;
            SqlConnection Cnn = new SqlConnection(connectionString);
            SqlCommand Cmd = new SqlCommand("tblUser_selects", Cnn);
            Cmd.CommandType = CommandType.StoredProcedure;
            Cmd.Parameters.AddWithValue("@userID", (int)Session["user_id1"]);
            Cnn.Open();
            int i = Cmd.ExecuteNonQuery();
            rptInforGr.DataSource = Cmd.ExecuteReader();
            rptInforGr.DataBind();
            Cnn.Close();
            Cnn.Dispose();
        }

        protected void rptInforGr_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void rptInforGr_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            
        }
    }
}

//string connectionString = ConfigurationManager.ConnectionStrings["connectToDB"].ConnectionString;
//SqlConnection Cnn = new SqlConnection(connectionString);
//SqlCommand Cmd = new SqlCommand("tblUser_changeInfor", Cnn);
//Cmd.CommandType = CommandType.StoredProcedure;
//Cmd.Parameters.AddWithValue("@userID", (int) Session["user_id1"]);
//Cmd.Parameters.AddWithValue("@imageAvatar", ;
//Cnn.Open();
//rptInforGr.DataSource = Cmd.ExecuteReader();
//rptInforGr.DataBind();
//rptInforGr.DataSource = Cmd.ExecuteReader();
//rptInforGr.DataBind();
//Cnn.Close();
//Cnn.Dispose();

//string connectionString = ConfigurationManager.ConnectionStrings["connectToDB"].ConnectionString;
//SqlConnection Cnn = new SqlConnection(connectionString);
//Cnn.Open();
//SqlDataAdapter sda = new SqlDataAdapter("select * from tblUsers", Cnn);
//DataTable dt = new DataTable();
//sda.Fill(dt);
//rptInforGr.DataSource = dt;
//rptInforGr.DataBind();
//rptImg.DataSource = dt;
//rptImg.DataBind();
//sda.Dispose();
//Cnn.Close();
//Cnn.Dispose();